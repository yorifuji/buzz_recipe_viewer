// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'favorite_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$favoriteCollectionHash() =>
    r'77698d7e20bcad05eedd71a4c5192266cb621a55';

/// See also [favoriteCollection].
@ProviderFor(favoriteCollection)
final favoriteCollectionProvider =
    AutoDisposeProvider<CollectionReference<Favorite>>.internal(
  favoriteCollection,
  name: r'favoriteCollectionProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$favoriteCollectionHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FavoriteCollectionRef
    = AutoDisposeProviderRef<CollectionReference<Favorite>>;
String _$favoriteDocumentHash() => r'ba8fe2a2819d426bb5a976cd50a7ae7a9c95d8f5';

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

/// See also [favoriteDocument].
@ProviderFor(favoriteDocument)
const favoriteDocumentProvider = FavoriteDocumentFamily();

/// See also [favoriteDocument].
class FavoriteDocumentFamily extends Family<DocumentReference<Favorite>> {
  /// See also [favoriteDocument].
  const FavoriteDocumentFamily();

  /// See also [favoriteDocument].
  FavoriteDocumentProvider call(
    String favoriteId,
  ) {
    return FavoriteDocumentProvider(
      favoriteId,
    );
  }

  @override
  FavoriteDocumentProvider getProviderOverride(
    covariant FavoriteDocumentProvider provider,
  ) {
    return call(
      provider.favoriteId,
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
  String? get name => r'favoriteDocumentProvider';
}

/// See also [favoriteDocument].
class FavoriteDocumentProvider
    extends AutoDisposeProvider<DocumentReference<Favorite>> {
  /// See also [favoriteDocument].
  FavoriteDocumentProvider(
    String favoriteId,
  ) : this._internal(
          (ref) => favoriteDocument(
            ref as FavoriteDocumentRef,
            favoriteId,
          ),
          from: favoriteDocumentProvider,
          name: r'favoriteDocumentProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$favoriteDocumentHash,
          dependencies: FavoriteDocumentFamily._dependencies,
          allTransitiveDependencies:
              FavoriteDocumentFamily._allTransitiveDependencies,
          favoriteId: favoriteId,
        );

  FavoriteDocumentProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.favoriteId,
  }) : super.internal();

  final String favoriteId;

  @override
  Override overrideWith(
    DocumentReference<Favorite> Function(FavoriteDocumentRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FavoriteDocumentProvider._internal(
        (ref) => create(ref as FavoriteDocumentRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        favoriteId: favoriteId,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<DocumentReference<Favorite>> createElement() {
    return _FavoriteDocumentProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FavoriteDocumentProvider && other.favoriteId == favoriteId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, favoriteId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FavoriteDocumentRef
    on AutoDisposeProviderRef<DocumentReference<Favorite>> {
  /// The parameter `favoriteId` of this provider.
  String get favoriteId;
}

class _FavoriteDocumentProviderElement
    extends AutoDisposeProviderElement<DocumentReference<Favorite>>
    with FavoriteDocumentRef {
  _FavoriteDocumentProviderElement(super.provider);

  @override
  String get favoriteId => (origin as FavoriteDocumentProvider).favoriteId;
}

String _$favoriteQueryHash() => r'be43d0b1c2e8a03dffa93a098a5850a67ad0cc31';

/// See also [favoriteQuery].
@ProviderFor(favoriteQuery)
final favoriteQueryProvider = AutoDisposeProvider<Query<Favorite>>.internal(
  favoriteQuery,
  name: r'favoriteQueryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$favoriteQueryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FavoriteQueryRef = AutoDisposeProviderRef<Query<Favorite>>;
String _$favoriteStreamHash() => r'de69982fb9e255636f1dff3712f421b49dbe335e';

/// See also [favoriteStream].
@ProviderFor(favoriteStream)
const favoriteStreamProvider = FavoriteStreamFamily();

/// See also [favoriteStream].
class FavoriteStreamFamily extends Family<AsyncValue<List<Favorite>>> {
  /// See also [favoriteStream].
  const FavoriteStreamFamily();

  /// See also [favoriteStream].
  FavoriteStreamProvider call(
    int limit,
  ) {
    return FavoriteStreamProvider(
      limit,
    );
  }

  @override
  FavoriteStreamProvider getProviderOverride(
    covariant FavoriteStreamProvider provider,
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
  String? get name => r'favoriteStreamProvider';
}

/// See also [favoriteStream].
class FavoriteStreamProvider extends AutoDisposeStreamProvider<List<Favorite>> {
  /// See also [favoriteStream].
  FavoriteStreamProvider(
    int limit,
  ) : this._internal(
          (ref) => favoriteStream(
            ref as FavoriteStreamRef,
            limit,
          ),
          from: favoriteStreamProvider,
          name: r'favoriteStreamProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$favoriteStreamHash,
          dependencies: FavoriteStreamFamily._dependencies,
          allTransitiveDependencies:
              FavoriteStreamFamily._allTransitiveDependencies,
          limit: limit,
        );

  FavoriteStreamProvider._internal(
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
    Stream<List<Favorite>> Function(FavoriteStreamRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FavoriteStreamProvider._internal(
        (ref) => create(ref as FavoriteStreamRef),
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
  AutoDisposeStreamProviderElement<List<Favorite>> createElement() {
    return _FavoriteStreamProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FavoriteStreamProvider && other.limit == limit;
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
mixin FavoriteStreamRef on AutoDisposeStreamProviderRef<List<Favorite>> {
  /// The parameter `limit` of this provider.
  int get limit;
}

class _FavoriteStreamProviderElement
    extends AutoDisposeStreamProviderElement<List<Favorite>>
    with FavoriteStreamRef {
  _FavoriteStreamProviderElement(super.provider);

  @override
  int get limit => (origin as FavoriteStreamProvider).limit;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
