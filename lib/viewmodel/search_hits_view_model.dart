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
  timestamp('recipe_published_timestamp_desc'),
  likes('recipe_likes_desc'),
  views('recipe_views_desc');

  final String indexName;
  const SortIndex(this.indexName);
}

@freezed
class SearchHitsState with _$SearchHitsState {
  const factory SearchHitsState({
    @Default('') String query,
    @Default(<SearchHitItem>[]) List<SearchHitItem> hitList,
    @Default(SortIndex.timestamp) SortIndex sortType,
  }) = _SearchHitsState;
}

class SearchHitsViewModel extends StateNotifier<SearchHitsState> {
  SearchHitsViewModel(this.repository) : super(const SearchHitsState()) {
    search();
  }

  final SearchRepository repository;

  Future<void> search() async {
    final searchHitList = await repository.search(
      state.query,
      state.sortType.indexName,
    );
    if (!mounted) {
      return;
    }
    state = state.copyWith(
      hitList: searchHitList
          .map(
            (e) => SearchHitItem(
              searchHit: e,
            ),
          )
          .toList(),
    );
  }

  void toogleDescription(SearchHitItem item) {
    final newHitList = state.hitList.map((e) {
      if (e.searchHit.id == item.searchHit.id) {
        return SearchHitItem(
          searchHit: e.searchHit,
          isDescriptionExpanded: !e.isDescriptionExpanded,
        );
      } else {
        return e;
      }
    }).toList();

    state = state.copyWith(hitList: newHitList);
  }

  void updateQuery(String query) {
    state = state.copyWith(query: query);
  }

  void updateSortType(SortIndex sortType) {
    state = state.copyWith(sortType: sortType);
  }
}
