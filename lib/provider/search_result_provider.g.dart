// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'search_result_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$searchResultHash() => r'eb622a8df44ed23e0d2f577ae0254f904ae01568';

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

/// See also [searchResult].
@ProviderFor(searchResult)
const searchResultProvider = SearchResultFamily();

/// See also [searchResult].
class SearchResultFamily extends Family<AsyncValue<SearchResult>> {
  /// See also [searchResult].
  const SearchResultFamily();

  /// See also [searchResult].
  SearchResultProvider call({
    required String indexName,
    required SearchRequest searchRequest,
  }) {
    return SearchResultProvider(
      indexName: indexName,
      searchRequest: searchRequest,
    );
  }

  @override
  SearchResultProvider getProviderOverride(
    covariant SearchResultProvider provider,
  ) {
    return call(
      indexName: provider.indexName,
      searchRequest: provider.searchRequest,
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
  String? get name => r'searchResultProvider';
}

/// See also [searchResult].
class SearchResultProvider extends AutoDisposeStreamProvider<SearchResult> {
  /// See also [searchResult].
  SearchResultProvider({
    required String indexName,
    required SearchRequest searchRequest,
  }) : this._internal(
          (ref) => searchResult(
            ref as SearchResultRef,
            indexName: indexName,
            searchRequest: searchRequest,
          ),
          from: searchResultProvider,
          name: r'searchResultProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$searchResultHash,
          dependencies: SearchResultFamily._dependencies,
          allTransitiveDependencies:
              SearchResultFamily._allTransitiveDependencies,
          indexName: indexName,
          searchRequest: searchRequest,
        );

  SearchResultProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.indexName,
    required this.searchRequest,
  }) : super.internal();

  final String indexName;
  final SearchRequest searchRequest;

  @override
  Override overrideWith(
    Stream<SearchResult> Function(SearchResultRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SearchResultProvider._internal(
        (ref) => create(ref as SearchResultRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        indexName: indexName,
        searchRequest: searchRequest,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<SearchResult> createElement() {
    return _SearchResultProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SearchResultProvider &&
        other.indexName == indexName &&
        other.searchRequest == searchRequest;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, indexName.hashCode);
    hash = _SystemHash.combine(hash, searchRequest.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SearchResultRef on AutoDisposeStreamProviderRef<SearchResult> {
  /// The parameter `indexName` of this provider.
  String get indexName;

  /// The parameter `searchRequest` of this provider.
  SearchRequest get searchRequest;
}

class _SearchResultProviderElement
    extends AutoDisposeStreamProviderElement<SearchResult>
    with SearchResultRef {
  _SearchResultProviderElement(super.provider);

  @override
  String get indexName => (origin as SearchResultProvider).indexName;
  @override
  SearchRequest get searchRequest =>
      (origin as SearchResultProvider).searchRequest;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
