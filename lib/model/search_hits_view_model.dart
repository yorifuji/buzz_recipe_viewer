import 'package:buzz_recipe_viewer/model/search_hit.dart';
import 'package:buzz_recipe_viewer/model/search_repository.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_hits_view_model.freezed.dart';

final searchHitsProvider =
    StateNotifierProvider<SearchHitsViewModel, SearchHitsState>((ref) {
  final repository = ref.watch(searchRepositoryProvider);
  return SearchHitsViewModel(repository);
});

enum SortType {
  timestamp('追加日（新しい順）', Icon(Icons.calendar_month),
      'recipe_published_timestamp_desc'),
  likes('人気順（いいね）', Icon(Icons.thumb_up), 'recipe_likes_desc'),
  views('人気順（閲覧数）', Icon(Icons.trending_up), 'recipe_views_desc');

  final String title;
  final Widget icon;
  final String indexName;
  const SortType(this.title, this.icon, this.indexName);
}

@freezed
class SearchHitsState with _$SearchHitsState {
  const factory SearchHitsState({
    @Default('') String query,
    @Default(<SearchHitItem>[]) List<SearchHitItem> hitList,
    @Default(SortType.timestamp) SortType sortType,
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

  void updateSortType(SortType sortType) {
    state = state.copyWith(sortType: sortType);
  }
}
