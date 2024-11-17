// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'firestore_path_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$firestorePathHash() => r'823f4a4c09d22a6f1638f5d8d91b7c32d87a665b';

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

/// See also [firestorePath].
@ProviderFor(firestorePath)
const firestorePathProvider = FirestorePathFamily();

/// See also [firestorePath].
class FirestorePathFamily extends Family<String> {
  /// See also [firestorePath].
  const FirestorePathFamily();

  /// See also [firestorePath].
  FirestorePathProvider call(
    FirestorePath databasePath,
  ) {
    return FirestorePathProvider(
      databasePath,
    );
  }

  @override
  FirestorePathProvider getProviderOverride(
    covariant FirestorePathProvider provider,
  ) {
    return call(
      provider.databasePath,
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
  String? get name => r'firestorePathProvider';
}

/// See also [firestorePath].
class FirestorePathProvider extends AutoDisposeProvider<String> {
  /// See also [firestorePath].
  FirestorePathProvider(
    FirestorePath databasePath,
  ) : this._internal(
          (ref) => firestorePath(
            ref as FirestorePathRef,
            databasePath,
          ),
          from: firestorePathProvider,
          name: r'firestorePathProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$firestorePathHash,
          dependencies: FirestorePathFamily._dependencies,
          allTransitiveDependencies:
              FirestorePathFamily._allTransitiveDependencies,
          databasePath: databasePath,
        );

  FirestorePathProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.databasePath,
  }) : super.internal();

  final FirestorePath databasePath;

  @override
  Override overrideWith(
    String Function(FirestorePathRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FirestorePathProvider._internal(
        (ref) => create(ref as FirestorePathRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        databasePath: databasePath,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<String> createElement() {
    return _FirestorePathProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FirestorePathProvider && other.databasePath == databasePath;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, databasePath.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FirestorePathRef on AutoDisposeProviderRef<String> {
  /// The parameter `databasePath` of this provider.
  FirestorePath get databasePath;
}

class _FirestorePathProviderElement extends AutoDisposeProviderElement<String>
    with FirestorePathRef {
  _FirestorePathProviderElement(super.provider);

  @override
  FirestorePath get databasePath =>
      (origin as FirestorePathProvider).databasePath;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
