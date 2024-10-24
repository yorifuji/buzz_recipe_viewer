// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'recipe_edit_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$recipeEditNotifierHash() =>
    r'0570b0ea476c6b7e800eab7283d882233b7f7e0e';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$RecipeEditNotifier
    extends BuildlessAutoDisposeNotifier<RecipeEditState> {
  late final Recipe? recipe;

  RecipeEditState build(
    Recipe? recipe,
  );
}

/// See also [RecipeEditNotifier].
@ProviderFor(RecipeEditNotifier)
const recipeEditNotifierProvider = RecipeEditNotifierFamily();

/// See also [RecipeEditNotifier].
class RecipeEditNotifierFamily extends Family<RecipeEditState> {
  /// See also [RecipeEditNotifier].
  const RecipeEditNotifierFamily();

  /// See also [RecipeEditNotifier].
  RecipeEditNotifierProvider call(
    Recipe? recipe,
  ) {
    return RecipeEditNotifierProvider(
      recipe,
    );
  }

  @override
  RecipeEditNotifierProvider getProviderOverride(
    covariant RecipeEditNotifierProvider provider,
  ) {
    return call(
      provider.recipe,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'recipeEditNotifierProvider';
}

/// See also [RecipeEditNotifier].
class RecipeEditNotifierProvider extends AutoDisposeNotifierProviderImpl<
    RecipeEditNotifier, RecipeEditState> {
  /// See also [RecipeEditNotifier].
  RecipeEditNotifierProvider(
    Recipe? recipe,
  ) : this._internal(
          () => RecipeEditNotifier()..recipe = recipe,
          from: recipeEditNotifierProvider,
          name: r'recipeEditNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$recipeEditNotifierHash,
          dependencies: RecipeEditNotifierFamily._dependencies,
          allTransitiveDependencies:
              RecipeEditNotifierFamily._allTransitiveDependencies,
          recipe: recipe,
        );

  RecipeEditNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.recipe,
  }) : super.internal();

  final Recipe? recipe;

  @override
  RecipeEditState runNotifierBuild(
    covariant RecipeEditNotifier notifier,
  ) {
    return notifier.build(
      recipe,
    );
  }

  @override
  Override overrideWith(RecipeEditNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: RecipeEditNotifierProvider._internal(
        () => create()..recipe = recipe,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        recipe: recipe,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<RecipeEditNotifier, RecipeEditState>
      createElement() {
    return _RecipeEditNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RecipeEditNotifierProvider && other.recipe == recipe;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, recipe.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin RecipeEditNotifierRef on AutoDisposeNotifierProviderRef<RecipeEditState> {
  /// The parameter `recipe` of this provider.
  Recipe? get recipe;
}

class _RecipeEditNotifierProviderElement
    extends AutoDisposeNotifierProviderElement<RecipeEditNotifier,
        RecipeEditState> with RecipeEditNotifierRef {
  _RecipeEditNotifierProviderElement(super.provider);

  @override
  Recipe? get recipe => (origin as RecipeEditNotifierProvider).recipe;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
