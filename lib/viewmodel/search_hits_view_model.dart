import 'package:buzz_recipe_viewer/model/search_hit.dart';
import 'package:buzz_recipe_viewer/repository/search_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_hits_view_model.freezed.dart';

final searchHitsProvider =
    StateNotifierProvider<SearchHitsViewModel, SearchHitsState>((ref) {
  final repository = ref.watch(searchRepositoryProvider);
  return SearchHitsViewModel(repository);
});

enum SortIndex {
  relevance('recipe'),
  timestamp('recipe_timestamp_desc'),
  likes('recipe_likes_desc'),
  views('recipe_views_desc');

  final String indexName;
  const SortIndex(this.indexName);
}

enum LoadingState {
  loadable,
  loading,
  success,
  failure,
}

@freezed
class SearchHitsState with _$SearchHitsState {
  const factory SearchHitsState({
    @Default('') String query,
    @Default(<SearchHitItem>[]) List<SearchHitItem> hitList,
    @Default(SortIndex.timestamp) SortIndex sortType,
    @Default(0) int nextPage,
    @Default(LoadingState.loadable) LoadingState loadingState,
    @Default(LoadingState.loadable) LoadingState moreLoadingState,
  }) = _SearchHitsState;
}

class SearchHitsViewModel extends StateNotifier<SearchHitsState> {
  SearchHitsViewModel(this.repository) : super(const SearchHitsState()) {
    search();
  }

  final SearchRepository repository;

  Future<void> search() async {
    state = state.copyWith(
      loadingState: LoadingState.loading,
      nextPage: 0,
      hitList: [],
    );

    final searchHitResult = await repository.search(
      state.query,
      state.sortType.indexName,
      state.nextPage,
    );
    if (!mounted) {
      return;
    }

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

    final searchHitResult = await repository.search(
      state.query,
      state.sortType.indexName,
      state.nextPage,
    );
    if (!mounted) {
      return;
    }

    searchHitResult.when(
      success: (result) {
        state = state.copyWith(
          moreLoadingState: LoadingState.success,
          hitList: [
            ...state.hitList,
            ...result.searchHits
                .map(
                  (e) => SearchHitItem(
                    searchHit: e,
                  ),
                )
                .toList()
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
}
