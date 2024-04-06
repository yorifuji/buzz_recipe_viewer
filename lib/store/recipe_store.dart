import 'package:buzz_recipe_viewer/model/recipe.dart';
import 'package:buzz_recipe_viewer/store/favorite_store.dart';
import 'package:buzz_recipe_viewer/store/search_hit_store.dart';
import 'package:collection/collection.dart';
import 'package:mockito/mockito.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'recipe_store.g.dart';

@riverpod
class RecipeStore extends _$RecipeStore {
  @override
  List<Recipe> build() {
    final searchHitList = ref.watch(searchHitStoreProvider);
    final favoriteList = ref.watch(favoriteStoreProvider);

    if (favoriteList.isEmpty) {
      return searchHitList.map((e) => Recipe(searchHit: e)).toList();
    } else {
      return searchHitList.map((searchHit) {
        final favorite = favoriteList.firstWhereOrNull(
          (favorite) => favorite.searchHitId == searchHit.id,
        );
        return Recipe(
          searchHit: searchHit,
          favorite: favorite,
        );
      }).toList();
    }
  }
}

class FakeRecipeStore extends _$RecipeStore with Mock implements RecipeStore {
  @override
  List<Recipe> build() => [];
}
