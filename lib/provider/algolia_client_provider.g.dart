// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'algolia_client_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$algoliaClientHash() => r'2d58ff0daac6a268cea34ad4c691ae96fc3f333c';

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

/// See also [algoliaClient].
@ProviderFor(algoliaClient)
const algoliaClientProvider = AlgoliaClientFamily();

/// See also [algoliaClient].
class AlgoliaClientFamily extends Family<HitsSearcher> {
  /// See also [algoliaClient].
  const AlgoliaClientFamily();

  /// See also [algoliaClient].
  AlgoliaClientProvider call({
    required String indexName,
  }) {
    return AlgoliaClientProvider(
      indexName: indexName,
    );
  }

  @override
  AlgoliaClientProvider getProviderOverride(
    covariant AlgoliaClientProvider provider,
  ) {
    return call(
      indexName: provider.indexName,
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
  String? get name => r'algoliaClientProvider';
}

/// See also [algoliaClient].
class AlgoliaClientProvider extends AutoDisposeProvider<HitsSearcher> {
  /// See also [algoliaClient].
  AlgoliaClientProvider({
    required String indexName,
  }) : this._internal(
          (ref) => algoliaClient(
            ref as AlgoliaClientRef,
            indexName: indexName,
          ),
          from: algoliaClientProvider,
          name: r'algoliaClientProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$algoliaClientHash,
          dependencies: AlgoliaClientFamily._dependencies,
          allTransitiveDependencies:
              AlgoliaClientFamily._allTransitiveDependencies,
          indexName: indexName,
        );

  AlgoliaClientProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.indexName,
  }) : super.internal();

  final String indexName;

  @override
  Override overrideWith(
    HitsSearcher Function(AlgoliaClientRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AlgoliaClientProvider._internal(
        (ref) => create(ref as AlgoliaClientRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        indexName: indexName,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<HitsSearcher> createElement() {
    return _AlgoliaClientProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AlgoliaClientProvider && other.indexName == indexName;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, indexName.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AlgoliaClientRef on AutoDisposeProviderRef<HitsSearcher> {
  /// The parameter `indexName` of this provider.
  String get indexName;
}

class _AlgoliaClientProviderElement
    extends AutoDisposeProviderElement<HitsSearcher> with AlgoliaClientRef {
  _AlgoliaClientProviderElement(super.provider);

  @override
  String get indexName => (origin as AlgoliaClientProvider).indexName;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
