import 'package:buzz_recipe_viewer/model/recipe.dart';
import 'package:buzz_recipe_viewer/repository/firestore/recipe_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:mockito/mockito.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'recipe_notifier.g.dart';

@riverpod
class RecipeWindowNotifier extends _$RecipeWindowNotifier {
  static const int _pageSize = kDebugMode ? 5 : 10;
  @override
  int build() => _pageSize;
  void growWindow() => state += _pageSize;
  void resetWindow() => state = _pageSize;
}

class RecipeWindowNotifierMock extends _$RecipeWindowNotifier
    with Mock
    implements RecipeWindowNotifier {
  @override
  int build() => 1;
}

@riverpod
class CachedRecipeNotifier extends _$CachedRecipeNotifier {
  @override
  FutureOr<List<Recipe>> build() {
    final windowSize = ref.watch(recipeWindowNotifierProvider);
    ref.listen(recipeStreamProvider(windowSize), (_, next) {
      if (next.hasValue) {
        state = AsyncData(next.requireValue);
      }
    });
    return state.hasValue ? state.requireValue : [];
  }

  void reset() {
    ref
      ..invalidateSelf()
      ..invalidate(recipeWindowNotifierProvider);
  }
}
