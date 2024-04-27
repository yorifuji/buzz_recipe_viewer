// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'preference_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$boolPreferenceHash() => r'e824c16586401513df134ecf0467c37d23d5ccca';

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

abstract class _$BoolPreference extends BuildlessAutoDisposeNotifier<bool> {
  late final PreferenceKey<bool> keyValue;

  bool build(
    PreferenceKey<bool> keyValue,
  );
}

/// See also [BoolPreference].
@ProviderFor(BoolPreference)
const boolPreferenceProvider = BoolPreferenceFamily();

/// See also [BoolPreference].
class BoolPreferenceFamily extends Family<bool> {
  /// See also [BoolPreference].
  const BoolPreferenceFamily();

  /// See also [BoolPreference].
  BoolPreferenceProvider call(
    PreferenceKey<bool> keyValue,
  ) {
    return BoolPreferenceProvider(
      keyValue,
    );
  }

  @override
  BoolPreferenceProvider getProviderOverride(
    covariant BoolPreferenceProvider provider,
  ) {
    return call(
      provider.keyValue,
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
  String? get name => r'boolPreferenceProvider';
}

/// See also [BoolPreference].
class BoolPreferenceProvider
    extends AutoDisposeNotifierProviderImpl<BoolPreference, bool> {
  /// See also [BoolPreference].
  BoolPreferenceProvider(
    PreferenceKey<bool> keyValue,
  ) : this._internal(
          () => BoolPreference()..keyValue = keyValue,
          from: boolPreferenceProvider,
          name: r'boolPreferenceProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$boolPreferenceHash,
          dependencies: BoolPreferenceFamily._dependencies,
          allTransitiveDependencies:
              BoolPreferenceFamily._allTransitiveDependencies,
          keyValue: keyValue,
        );

  BoolPreferenceProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.keyValue,
  }) : super.internal();

  final PreferenceKey<bool> keyValue;

  @override
  bool runNotifierBuild(
    covariant BoolPreference notifier,
  ) {
    return notifier.build(
      keyValue,
    );
  }

  @override
  Override overrideWith(BoolPreference Function() create) {
    return ProviderOverride(
      origin: this,
      override: BoolPreferenceProvider._internal(
        () => create()..keyValue = keyValue,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        keyValue: keyValue,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<BoolPreference, bool> createElement() {
    return _BoolPreferenceProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is BoolPreferenceProvider && other.keyValue == keyValue;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, keyValue.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin BoolPreferenceRef on AutoDisposeNotifierProviderRef<bool> {
  /// The parameter `keyValue` of this provider.
  PreferenceKey<bool> get keyValue;
}

class _BoolPreferenceProviderElement
    extends AutoDisposeNotifierProviderElement<BoolPreference, bool>
    with BoolPreferenceRef {
  _BoolPreferenceProviderElement(super.provider);

  @override
  PreferenceKey<bool> get keyValue =>
      (origin as BoolPreferenceProvider).keyValue;
}

String _$intPreferenceHash() => r'1e3fa67172a45fa5c3a92e25fafe36e541762d6b';

abstract class _$IntPreference extends BuildlessAutoDisposeNotifier<int> {
  late final PreferenceKey<int> keyValue;

  int build(
    PreferenceKey<int> keyValue,
  );
}

/// See also [IntPreference].
@ProviderFor(IntPreference)
const intPreferenceProvider = IntPreferenceFamily();

/// See also [IntPreference].
class IntPreferenceFamily extends Family<int> {
  /// See also [IntPreference].
  const IntPreferenceFamily();

  /// See also [IntPreference].
  IntPreferenceProvider call(
    PreferenceKey<int> keyValue,
  ) {
    return IntPreferenceProvider(
      keyValue,
    );
  }

  @override
  IntPreferenceProvider getProviderOverride(
    covariant IntPreferenceProvider provider,
  ) {
    return call(
      provider.keyValue,
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
  String? get name => r'intPreferenceProvider';
}

/// See also [IntPreference].
class IntPreferenceProvider
    extends AutoDisposeNotifierProviderImpl<IntPreference, int> {
  /// See also [IntPreference].
  IntPreferenceProvider(
    PreferenceKey<int> keyValue,
  ) : this._internal(
          () => IntPreference()..keyValue = keyValue,
          from: intPreferenceProvider,
          name: r'intPreferenceProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$intPreferenceHash,
          dependencies: IntPreferenceFamily._dependencies,
          allTransitiveDependencies:
              IntPreferenceFamily._allTransitiveDependencies,
          keyValue: keyValue,
        );

  IntPreferenceProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.keyValue,
  }) : super.internal();

  final PreferenceKey<int> keyValue;

  @override
  int runNotifierBuild(
    covariant IntPreference notifier,
  ) {
    return notifier.build(
      keyValue,
    );
  }

  @override
  Override overrideWith(IntPreference Function() create) {
    return ProviderOverride(
      origin: this,
      override: IntPreferenceProvider._internal(
        () => create()..keyValue = keyValue,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        keyValue: keyValue,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<IntPreference, int> createElement() {
    return _IntPreferenceProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is IntPreferenceProvider && other.keyValue == keyValue;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, keyValue.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin IntPreferenceRef on AutoDisposeNotifierProviderRef<int> {
  /// The parameter `keyValue` of this provider.
  PreferenceKey<int> get keyValue;
}

class _IntPreferenceProviderElement
    extends AutoDisposeNotifierProviderElement<IntPreference, int>
    with IntPreferenceRef {
  _IntPreferenceProviderElement(super.provider);

  @override
  PreferenceKey<int> get keyValue => (origin as IntPreferenceProvider).keyValue;
}

String _$stringPreferenceHash() => r'733393a1e8abeb765d827ab0d0876bb012272b09';

abstract class _$StringPreference extends BuildlessAutoDisposeNotifier<String> {
  late final PreferenceKey<String> keyValue;

  String build(
    PreferenceKey<String> keyValue,
  );
}

/// See also [StringPreference].
@ProviderFor(StringPreference)
const stringPreferenceProvider = StringPreferenceFamily();

/// See also [StringPreference].
class StringPreferenceFamily extends Family<String> {
  /// See also [StringPreference].
  const StringPreferenceFamily();

  /// See also [StringPreference].
  StringPreferenceProvider call(
    PreferenceKey<String> keyValue,
  ) {
    return StringPreferenceProvider(
      keyValue,
    );
  }

  @override
  StringPreferenceProvider getProviderOverride(
    covariant StringPreferenceProvider provider,
  ) {
    return call(
      provider.keyValue,
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
  String? get name => r'stringPreferenceProvider';
}

/// See also [StringPreference].
class StringPreferenceProvider
    extends AutoDisposeNotifierProviderImpl<StringPreference, String> {
  /// See also [StringPreference].
  StringPreferenceProvider(
    PreferenceKey<String> keyValue,
  ) : this._internal(
          () => StringPreference()..keyValue = keyValue,
          from: stringPreferenceProvider,
          name: r'stringPreferenceProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$stringPreferenceHash,
          dependencies: StringPreferenceFamily._dependencies,
          allTransitiveDependencies:
              StringPreferenceFamily._allTransitiveDependencies,
          keyValue: keyValue,
        );

  StringPreferenceProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.keyValue,
  }) : super.internal();

  final PreferenceKey<String> keyValue;

  @override
  String runNotifierBuild(
    covariant StringPreference notifier,
  ) {
    return notifier.build(
      keyValue,
    );
  }

  @override
  Override overrideWith(StringPreference Function() create) {
    return ProviderOverride(
      origin: this,
      override: StringPreferenceProvider._internal(
        () => create()..keyValue = keyValue,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        keyValue: keyValue,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<StringPreference, String> createElement() {
    return _StringPreferenceProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is StringPreferenceProvider && other.keyValue == keyValue;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, keyValue.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin StringPreferenceRef on AutoDisposeNotifierProviderRef<String> {
  /// The parameter `keyValue` of this provider.
  PreferenceKey<String> get keyValue;
}

class _StringPreferenceProviderElement
    extends AutoDisposeNotifierProviderElement<StringPreference, String>
    with StringPreferenceRef {
  _StringPreferenceProviderElement(super.provider);

  @override
  PreferenceKey<String> get keyValue =>
      (origin as StringPreferenceProvider).keyValue;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
