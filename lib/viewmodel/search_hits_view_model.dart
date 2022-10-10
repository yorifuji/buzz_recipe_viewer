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
    @Default(AsyncValue.loading()) AsyncValue<List<SearchHitItem>> hitList,
    @Default(SortIndex.timestamp) SortIndex sortType,
  }) = _SearchHitsState;
}

class SearchHitsViewModel extends StateNotifier<SearchHitsState> {
  SearchHitsViewModel(this.repository) : super(const SearchHitsState()) {
    search();
  }

  final SearchRepository repository;

  Future<void> search() async {
    state = state.copyWith(hitList: const AsyncValue.loading());

    final searchHitResult = await repository.search(
      state.query,
      state.sortType.indexName,
    );
    if (!mounted) {
      return;
    }

    searchHitResult.when(
      success: (hitList) {
        state = state.copyWith(
          hitList: AsyncValue.data(
            hitList
                .map(
                  (e) => SearchHitItem(
                    searchHit: e,
                  ),
                )
                .toList(),
          ),
        );
      },
      failure: (error) {
        state = state.copyWith(
          hitList: AsyncValue.error(error, StackTrace.current),
        );
      },
    );
  }

  void toogleDescription(SearchHitItem item) {
    final newHitList = state.hitList.valueOrNull?.map((e) {
      if (e.searchHit.id == item.searchHit.id) {
        return SearchHitItem(
          searchHit: e.searchHit,
          isDescriptionExpanded: !e.isDescriptionExpanded,
        );
      } else {
        return e;
      }
    }).toList();

    if (newHitList != null) {
      state = state.copyWith(hitList: AsyncValue.data(newHitList));
    }
  }

  void updateQuery(String query) {
    state = state.copyWith(query: query);
  }

  void updateSortType(SortIndex sortType) {
    state = state.copyWith(sortType: sortType);
  }
}
