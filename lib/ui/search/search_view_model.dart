import 'package:buzz_recipe_viewer/model/favorite.dart';
import 'package:buzz_recipe_viewer/model/history.dart';
import 'package:buzz_recipe_viewer/model/loading_state.dart';
import 'package:buzz_recipe_viewer/model/search_hit.dart';
import 'package:buzz_recipe_viewer/model/sort_index.dart';
import 'package:buzz_recipe_viewer/repository/database_repository.dart';
import 'package:buzz_recipe_viewer/repository/search_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_view_model.freezed.dart';
part 'search_view_model.g.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState({
    @Default('') String query,
    @Default(<SearchHitItem>[]) List<SearchHitItem> hitList,
    @Default(SortIndex.timestamp) SortIndex sortType,
    @Default(0) int nextPage,
    @Default(LoadingState.loadable) LoadingState loadingState,
    @Default(LoadingState.loadable) LoadingState moreLoadingState,
  }) = _SearchState;
}

@riverpod
class SearchViewModel extends _$SearchViewModel {
  late final SearchRepository _searchRepository;
  late final DatabaseRepository _databaseRepository;
  @override
  SearchState build() {
    _searchRepository = ref.read(searchRepositoryProvider);
    _databaseRepository = ref.read(databaseRepositoryProvider);
    return const SearchState();
  }

  Future<void> search() async {
    state = state.copyWith(
      loadingState: LoadingState.loading,
      nextPage: 0,
      hitList: [],
    );

    final searchHitResult = await _searchRepository.search(
      state.query,
      state.sortType.indexName,
      state.nextPage,
    );

    searchHitResult.when(
      success: (result) {
        state = state.copyWith(
          loadingState: LoadingState.success,
          hitList: result.searchHits
              .map(
                (e) => SearchHitItem(
                  searchHit: e,
                ),
              )
              .toList(),
          nextPage: result.nextPage,
        );
      },
      failure: (error) {
        state = state.copyWith(
          loadingState: LoadingState.failure,
        );
      },
    );
  }

  Future<void> searchMore() async {
    state = state.copyWith(
      moreLoadingState: LoadingState.loading,
    );

    final searchHitResult = await _searchRepository.search(
      state.query,
      state.sortType.indexName,
      state.nextPage,
    );

    searchHitResult.when(
      success: (result) {
        state = state.copyWith(
          moreLoadingState: LoadingState.success,
          hitList: [
            ...state.hitList,
            ...result.searchHits.map(
              (e) => SearchHitItem(
                searchHit: e,
              ),
            )
          ],
          nextPage: result.nextPage,
        );
      },
      failure: (error) {
        state = state.copyWith(
          moreLoadingState: LoadingState.failure,
        );
      },
    );
  }

  void updateQuery(String query) {
    state = state.copyWith(query: query);
  }

  void updateSortType(SortIndex sortType) {
    state = state.copyWith(sortType: sortType);
  }

  // insert item to database
  Future<void> insertHistory(SearchHit searchHit) async {
    await _databaseRepository.insertHistory(History.from(searchHit));
  }

  Future<void> addFavorite(SearchHit searchHit) async {
    await _databaseRepository.insertFavorite(Favorite.from(searchHit));
  }
}
