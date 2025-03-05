// ignore_for_file: avoid_setters_without_getters

import 'package:buzz_recipe_viewer/domain/model/search_hit.dart';
import 'package:buzz_recipe_viewer/domain/model/sort_index.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_state_store.freezed.dart';
part 'search_state_store.g.dart';

@freezed
abstract class SearchState with _$SearchState {
  const factory SearchState({
    @Default('') String query,
    @Default(SortIndex.timestamp) SortIndex sortType,
    @Default(0) int nextPage,
    @Default(<SearchHit>[]) List<SearchHit> searchHits,
  }) = _SearchState;
}

@riverpod
class SearchStateStore extends _$SearchStateStore {
  @override
  SearchState build() => const SearchState();

  void setQuery(String query) => state = state.copyWith(query: query);
  void setSortType(SortIndex sortType) =>
      state = state.copyWith(sortType: sortType);
  void setNextPage(int nextPage) => state = state.copyWith(nextPage: nextPage);
  void setSearchHits(List<SearchHit> searchHits) =>
      state = state.copyWith(searchHits: searchHits);
  void addSearchHits(List<SearchHit> searchHits) =>
      state = state.copyWith(searchHits: [...state.searchHits, ...searchHits]);

  String query() => state.query;
  SortIndex sortType() => state.sortType;
  int nextPage() => state.nextPage;
  List<SearchHit> searchHits() => state.searchHits;
}
