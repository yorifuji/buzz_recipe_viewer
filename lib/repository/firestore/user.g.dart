// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'user.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$usersStreamHash() => r'0e081a282b6af46320edc38508b87623170e416e';

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

/// See also [usersStream].
@ProviderFor(usersStream)
const usersStreamProvider = UsersStreamFamily();

/// See also [usersStream].
class UsersStreamFamily extends Family<AsyncValue<List<User>>> {
  /// See also [usersStream].
  const UsersStreamFamily();

  /// See also [usersStream].
  UsersStreamProvider call(
    int limit,
  ) {
    return UsersStreamProvider(
      limit,
    );
  }

  @override
  UsersStreamProvider getProviderOverride(
    covariant UsersStreamProvider provider,
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
  String? get name => r'usersStreamProvider';
}

/// See also [usersStream].
class UsersStreamProvider extends AutoDisposeStreamProvider<List<User>> {
  /// See also [usersStream].
  UsersStreamProvider(
    int limit,
  ) : this._internal(
          (ref) => usersStream(
            ref as UsersStreamRef,
            limit,
          ),
          from: usersStreamProvider,
          name: r'usersStreamProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$usersStreamHash,
          dependencies: UsersStreamFamily._dependencies,
          allTransitiveDependencies:
              UsersStreamFamily._allTransitiveDependencies,
          limit: limit,
        );

  UsersStreamProvider._internal(
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
    Stream<List<User>> Function(UsersStreamRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UsersStreamProvider._internal(
        (ref) => create(ref as UsersStreamRef),
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
  AutoDisposeStreamProviderElement<List<User>> createElement() {
    return _UsersStreamProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UsersStreamProvider && other.limit == limit;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, limit.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin UsersStreamRef on AutoDisposeStreamProviderRef<List<User>> {
  /// The parameter `limit` of this provider.
  int get limit;
}

class _UsersStreamProviderElement
    extends AutoDisposeStreamProviderElement<List<User>> with UsersStreamRef {
  _UsersStreamProviderElement(super.provider);

  @override
  int get limit => (origin as UsersStreamProvider).limit;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
