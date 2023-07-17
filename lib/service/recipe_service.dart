import 'package:buzz_recipe_viewer/model/sort_index.dart';
import 'package:buzz_recipe_viewer/provider/flavor_provider.dart';
import 'package:buzz_recipe_viewer/repository/recipe_repository.dart';
import 'package:buzz_recipe_viewer/repository/recipe_repository_mock.dart';
import 'package:buzz_recipe_viewer/store/search_hit_store.dart';
import 'package:buzz_recipe_viewer/store/search_state_store.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'recipe_service.g.dart';

@riverpod
RecipeService recipeService(RecipeServiceRef ref) {
  final flavor = ref.watch(flavorProvider);
  return RecipeService(
    ref.watch(
      flavor == Flavor.dev
          ? recipeRepositoryMockProvider
          : recipeRepositoryProvider,
    ),
    ref.watch(searchHitStoreProvider.notifier),
    ref.watch(searchStateStoreProvider.notifier),
  );
}

class RecipeService {
  RecipeService(
    this._recipeRepository,
    this._searchHitStore,
    this._searchStateStore,
  );

  final RecipeRepository _recipeRepository;
  final SearchHitStore _searchHitStore;
  final SearchStateStore _searchStateStore;

  Future<bool> getRecipe(String query, SortIndex sortIndex) async {
    final getRecipeResult =
        await _recipeRepository.getRecipe(query, sortIndex.indexName, 0);

    getRecipeResult.when(
      success: (data) {
        _searchStateStore
          ..query = query
          ..sortType = sortIndex
          ..nextPage = data.nextPage;
        _searchHitStore.set(data.searchHits);
      },
      failure: (error) {},
    );

    return getRecipeResult.isSuccess;
  }

  Future<bool> getRecipeMore() async {
    final getRecipeResult = await _recipeRepository.getRecipe(
      _searchStateStore.query,
      _searchStateStore.sortType.indexName,
      _searchStateStore.nextPage,
    );

    getRecipeResult.when(
      success: (data) {
        _searchStateStore.nextPage = data.nextPage;
        _searchHitStore.add(data.searchHits);
      },
      failure: (error) {},
    );

    return getRecipeResult.isSuccess;
  }
}
