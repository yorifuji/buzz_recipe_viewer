import 'package:buzz_recipe_viewer/model/search_hit.dart';
import 'package:buzz_recipe_viewer/model/search_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_hits_view_model.freezed.dart';

final searchHitsProvider =
    StateNotifierProvider<SearchHitsViewModel, SearchHitsState>((ref) {
  final repository = ref.watch(searchRepositoryProvider);
  return SearchHitsViewModel(repository);
});

@freezed
class SearchHitsState with _$SearchHitsState {
  const factory SearchHitsState({
    @Default('') String query,
    @Default(<SearchHitItem>[]) List<SearchHitItem> hitList,
  }) = _SearchHitsState;
}

class SearchHitsViewModel extends StateNotifier<SearchHitsState> {
  SearchHitsViewModel(this.repository) : super(const SearchHitsState()) {
    search();
  }

  final SearchRepository repository;

  Future<void> search() async {
    final searchHitList = await repository.search(state.query);
    state = state.copyWith(
        hitList: searchHitList
            .map(
              (e) => SearchHitItem(
                searchHit: e,
              ),
            )
            .toList());
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
}
