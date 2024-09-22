// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'remote_config_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$boolRemoteConfigHash() => r'88988ea4d4e5eb55e20bb20e3feb4b4ca1718d0d';

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

abstract class _$BoolRemoteConfig extends BuildlessAutoDisposeNotifier<bool> {
  late final RemoteConfigSetting<bool> remoteConfigSetting;

  bool build(
    RemoteConfigSetting<bool> remoteConfigSetting,
  );
}

/// See also [BoolRemoteConfig].
@ProviderFor(BoolRemoteConfig)
const boolRemoteConfigProvider = BoolRemoteConfigFamily();

/// See also [BoolRemoteConfig].
class BoolRemoteConfigFamily extends Family<bool> {
  /// See also [BoolRemoteConfig].
  const BoolRemoteConfigFamily();

  /// See also [BoolRemoteConfig].
  BoolRemoteConfigProvider call(
    RemoteConfigSetting<bool> remoteConfigSetting,
  ) {
    return BoolRemoteConfigProvider(
      remoteConfigSetting,
    );
  }

  @override
  BoolRemoteConfigProvider getProviderOverride(
    covariant BoolRemoteConfigProvider provider,
  ) {
    return call(
      provider.remoteConfigSetting,
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
  String? get name => r'boolRemoteConfigProvider';
}

/// See also [BoolRemoteConfig].
class BoolRemoteConfigProvider
    extends AutoDisposeNotifierProviderImpl<BoolRemoteConfig, bool> {
  /// See also [BoolRemoteConfig].
  BoolRemoteConfigProvider(
    RemoteConfigSetting<bool> remoteConfigSetting,
  ) : this._internal(
          () => BoolRemoteConfig()..remoteConfigSetting = remoteConfigSetting,
          from: boolRemoteConfigProvider,
          name: r'boolRemoteConfigProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$boolRemoteConfigHash,
          dependencies: BoolRemoteConfigFamily._dependencies,
          allTransitiveDependencies:
              BoolRemoteConfigFamily._allTransitiveDependencies,
          remoteConfigSetting: remoteConfigSetting,
        );

  BoolRemoteConfigProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.remoteConfigSetting,
  }) : super.internal();

  final RemoteConfigSetting<bool> remoteConfigSetting;

  @override
  bool runNotifierBuild(
    covariant BoolRemoteConfig notifier,
  ) {
    return notifier.build(
      remoteConfigSetting,
    );
  }

  @override
  Override overrideWith(BoolRemoteConfig Function() create) {
    return ProviderOverride(
      origin: this,
      override: BoolRemoteConfigProvider._internal(
        () => create()..remoteConfigSetting = remoteConfigSetting,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        remoteConfigSetting: remoteConfigSetting,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<BoolRemoteConfig, bool> createElement() {
    return _BoolRemoteConfigProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is BoolRemoteConfigProvider &&
        other.remoteConfigSetting == remoteConfigSetting;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, remoteConfigSetting.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin BoolRemoteConfigRef on AutoDisposeNotifierProviderRef<bool> {
  /// The parameter `remoteConfigSetting` of this provider.
  RemoteConfigSetting<bool> get remoteConfigSetting;
}

class _BoolRemoteConfigProviderElement
    extends AutoDisposeNotifierProviderElement<BoolRemoteConfig, bool>
    with BoolRemoteConfigRef {
  _BoolRemoteConfigProviderElement(super.provider);

  @override
  RemoteConfigSetting<bool> get remoteConfigSetting =>
      (origin as BoolRemoteConfigProvider).remoteConfigSetting;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
