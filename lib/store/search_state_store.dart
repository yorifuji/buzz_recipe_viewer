// ignore_for_file: avoid_setters_without_getters

import 'package:buzz_recipe_viewer/model/sort_index.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_state_store.freezed.dart';
part 'search_state_store.g.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState({
    @Default('') String query,
    @Default(SortIndex.timestamp) SortIndex sortType,
    @Default(0) int nextPage,
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

  String query() => state.query;
  SortIndex sortType() => state.sortType;
  int nextPage() => state.nextPage;
}
