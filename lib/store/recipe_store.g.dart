// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'recipe_store.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$recipeStoreHash() => r'ee09730da2d3f3ff4e034894d2b522890738a737';

/// See also [RecipeStore].
@ProviderFor(RecipeStore)
final recipeStoreProvider =
    AutoDisposeNotifierProvider<RecipeStore, List<Recipe>>.internal(
  RecipeStore.new,
  name: r'recipeStoreProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$recipeStoreHash,
  dependencies: <ProviderOrFamily>[favoriteStoreProvider],
  allTransitiveDependencies: <ProviderOrFamily>{
    favoriteStoreProvider,
    ...?favoriteStoreProvider.allTransitiveDependencies
  },
);

typedef _$RecipeStore = AutoDisposeNotifier<List<Recipe>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
