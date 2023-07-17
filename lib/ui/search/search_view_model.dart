import 'package:buzz_recipe_viewer/model/loading_state.dart';
import 'package:buzz_recipe_viewer/model/sort_index.dart';
import 'package:buzz_recipe_viewer/service/recipe_service.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_view_model.freezed.dart';
part 'search_view_model.g.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState({
    @Default('') String query,
    @Default(SortIndex.timestamp) SortIndex sortType,
    @Default(LoadingState.loadable) LoadingState loadingState,
    @Default(LoadingState.loadable) LoadingState moreLoadingState,
  }) = _SearchState;
}

@riverpod
class SearchViewModel extends _$SearchViewModel {
  late RecipeService _recipeService;
  @override
  SearchState build() {
    _recipeService = ref.watch(recipeServiceProvider);
    return const SearchState();
  }

  Future<void> search() async {
    state = state.copyWith(
      loadingState: LoadingState.loading,
    );

    final result = await _recipeService.getRecipe(state.query, state.sortType);

    state = state.copyWith(
      loadingState: result ? LoadingState.success : LoadingState.failure,
    );
  }

  Future<void> searchMore() async {
    state = state.copyWith(
      moreLoadingState: LoadingState.loading,
    );

    final result = await _recipeService.getRecipeMore();

    state = state.copyWith(
      moreLoadingState: result ? LoadingState.success : LoadingState.failure,
    );
  }

  void updateQuery(String query) {
    state = state.copyWith(query: query);
  }

  void updateSortType(SortIndex sortType) {
    state = state.copyWith(sortType: sortType);
  }
}
