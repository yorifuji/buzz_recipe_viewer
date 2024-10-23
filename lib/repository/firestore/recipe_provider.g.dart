// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'recipe_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$recipeCollectionHash() => r'f087b5bf6c8e3fb07e714d4c0eb9890b52f11080';

/// See also [recipeCollection].
@ProviderFor(recipeCollection)
final recipeCollectionProvider =
    AutoDisposeProvider<CollectionReference<Recipe>>.internal(
  recipeCollection,
  name: r'recipeCollectionProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$recipeCollectionHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef RecipeCollectionRef
    = AutoDisposeProviderRef<CollectionReference<Recipe>>;
String _$recipeDocumentHash() => r'47b9033ed5049e8ec79f71b6fc74f9c40be14a4a';

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

/// See also [recipeDocument].
@ProviderFor(recipeDocument)
const recipeDocumentProvider = RecipeDocumentFamily();

/// See also [recipeDocument].
class RecipeDocumentFamily extends Family<DocumentReference<Recipe>> {
  /// See also [recipeDocument].
  const RecipeDocumentFamily();

  /// See also [recipeDocument].
  RecipeDocumentProvider call(
    String recipeId,
  ) {
    return RecipeDocumentProvider(
      recipeId,
    );
  }

  @override
  RecipeDocumentProvider getProviderOverride(
    covariant RecipeDocumentProvider provider,
  ) {
    return call(
      provider.recipeId,
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
  String? get name => r'recipeDocumentProvider';
}

/// See also [recipeDocument].
class RecipeDocumentProvider
    extends AutoDisposeProvider<DocumentReference<Recipe>> {
  /// See also [recipeDocument].
  RecipeDocumentProvider(
    String recipeId,
  ) : this._internal(
          (ref) => recipeDocument(
            ref as RecipeDocumentRef,
            recipeId,
          ),
          from: recipeDocumentProvider,
          name: r'recipeDocumentProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$recipeDocumentHash,
          dependencies: RecipeDocumentFamily._dependencies,
          allTransitiveDependencies:
              RecipeDocumentFamily._allTransitiveDependencies,
          recipeId: recipeId,
        );

  RecipeDocumentProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.recipeId,
  }) : super.internal();

  final String recipeId;

  @override
  Override overrideWith(
    DocumentReference<Recipe> Function(RecipeDocumentRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RecipeDocumentProvider._internal(
        (ref) => create(ref as RecipeDocumentRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        recipeId: recipeId,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<DocumentReference<Recipe>> createElement() {
    return _RecipeDocumentProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RecipeDocumentProvider && other.recipeId == recipeId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, recipeId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin RecipeDocumentRef on AutoDisposeProviderRef<DocumentReference<Recipe>> {
  /// The parameter `recipeId` of this provider.
  String get recipeId;
}

class _RecipeDocumentProviderElement
    extends AutoDisposeProviderElement<DocumentReference<Recipe>>
    with RecipeDocumentRef {
  _RecipeDocumentProviderElement(super.provider);

  @override
  String get recipeId => (origin as RecipeDocumentProvider).recipeId;
}

String _$recipeQueryHash() => r'4f8d7337b6964da67d80e5a375d4c51b98f9825c';

/// See also [recipeQuery].
@ProviderFor(recipeQuery)
final recipeQueryProvider = AutoDisposeProvider<Query<Recipe>>.internal(
  recipeQuery,
  name: r'recipeQueryProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$recipeQueryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef RecipeQueryRef = AutoDisposeProviderRef<Query<Recipe>>;
String _$recipeStreamHash() => r'aa56192419bb8828ee9602fa4537a558a68c1673';

/// See also [recipeStream].
@ProviderFor(recipeStream)
const recipeStreamProvider = RecipeStreamFamily();

/// See also [recipeStream].
class RecipeStreamFamily extends Family<AsyncValue<List<Recipe>>> {
  /// See also [recipeStream].
  const RecipeStreamFamily();

  /// See also [recipeStream].
  RecipeStreamProvider call(
    int limit,
  ) {
    return RecipeStreamProvider(
      limit,
    );
  }

  @override
  RecipeStreamProvider getProviderOverride(
    covariant RecipeStreamProvider provider,
  ) {
    return call(
      provider.limit,
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
  String? get name => r'recipeStreamProvider';
}

/// See also [recipeStream].
class RecipeStreamProvider extends AutoDisposeStreamProvider<List<Recipe>> {
  /// See also [recipeStream].
  RecipeStreamProvider(
    int limit,
  ) : this._internal(
          (ref) => recipeStream(
            ref as RecipeStreamRef,
            limit,
          ),
          from: recipeStreamProvider,
          name: r'recipeStreamProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$recipeStreamHash,
          dependencies: RecipeStreamFamily._dependencies,
          allTransitiveDependencies:
              RecipeStreamFamily._allTransitiveDependencies,
          limit: limit,
        );

  RecipeStreamProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.limit,
  }) : super.internal();

  final int limit;

  @override
  Override overrideWith(
    Stream<List<Recipe>> Function(RecipeStreamRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RecipeStreamProvider._internal(
        (ref) => create(ref as RecipeStreamRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        limit: limit,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<List<Recipe>> createElement() {
    return _RecipeStreamProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RecipeStreamProvider && other.limit == limit;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, limit.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin RecipeStreamRef on AutoDisposeStreamProviderRef<List<Recipe>> {
  /// The parameter `limit` of this provider.
  int get limit;
}

class _RecipeStreamProviderElement
    extends AutoDisposeStreamProviderElement<List<Recipe>>
    with RecipeStreamRef {
  _RecipeStreamProviderElement(super.provider);

  @override
  int get limit => (origin as RecipeStreamProvider).limit;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
