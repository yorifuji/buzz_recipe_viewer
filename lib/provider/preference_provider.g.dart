// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'preference_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$boolPreferenceHash() => r'3ecd0ef7061eb006fd9f42d8fb7ccd28e4352a82';

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
  late final Preference<bool> pref;

  bool build(
    Preference<bool> pref,
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
    Preference<bool> pref,
  ) {
    return BoolPreferenceProvider(
      pref,
    );
  }

  @override
  BoolPreferenceProvider getProviderOverride(
    covariant BoolPreferenceProvider provider,
  ) {
    return call(
      provider.pref,
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
    Preference<bool> pref,
  ) : this._internal(
          () => BoolPreference()..pref = pref,
          from: boolPreferenceProvider,
          name: r'boolPreferenceProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$boolPreferenceHash,
          dependencies: BoolPreferenceFamily._dependencies,
          allTransitiveDependencies:
              BoolPreferenceFamily._allTransitiveDependencies,
          pref: pref,
        );

  BoolPreferenceProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.pref,
  }) : super.internal();

  final Preference<bool> pref;

  @override
  bool runNotifierBuild(
    covariant BoolPreference notifier,
  ) {
    return notifier.build(
      pref,
    );
  }

  @override
  Override overrideWith(BoolPreference Function() create) {
    return ProviderOverride(
      origin: this,
      override: BoolPreferenceProvider._internal(
        () => create()..pref = pref,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        pref: pref,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<BoolPreference, bool> createElement() {
    return _BoolPreferenceProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is BoolPreferenceProvider && other.pref == pref;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, pref.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin BoolPreferenceRef on AutoDisposeNotifierProviderRef<bool> {
  /// The parameter `pref` of this provider.
  Preference<bool> get pref;
}

class _BoolPreferenceProviderElement
    extends AutoDisposeNotifierProviderElement<BoolPreference, bool>
    with BoolPreferenceRef {
  _BoolPreferenceProviderElement(super.provider);

  @override
  Preference<bool> get pref => (origin as BoolPreferenceProvider).pref;
}

String _$intPreferenceHash() => r'56e20d6aca92c639e1f4143dde2c8950ea2a621d';

abstract class _$IntPreference extends BuildlessAutoDisposeNotifier<int> {
  late final Preference<int> pref;

  int build(
    Preference<int> pref,
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
    Preference<int> pref,
  ) {
    return IntPreferenceProvider(
      pref,
    );
  }

  @override
  IntPreferenceProvider getProviderOverride(
    covariant IntPreferenceProvider provider,
  ) {
    return call(
      provider.pref,
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
    Preference<int> pref,
  ) : this._internal(
          () => IntPreference()..pref = pref,
          from: intPreferenceProvider,
          name: r'intPreferenceProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$intPreferenceHash,
          dependencies: IntPreferenceFamily._dependencies,
          allTransitiveDependencies:
              IntPreferenceFamily._allTransitiveDependencies,
          pref: pref,
        );

  IntPreferenceProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.pref,
  }) : super.internal();

  final Preference<int> pref;

  @override
  int runNotifierBuild(
    covariant IntPreference notifier,
  ) {
    return notifier.build(
      pref,
    );
  }

  @override
  Override overrideWith(IntPreference Function() create) {
    return ProviderOverride(
      origin: this,
      override: IntPreferenceProvider._internal(
        () => create()..pref = pref,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        pref: pref,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<IntPreference, int> createElement() {
    return _IntPreferenceProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is IntPreferenceProvider && other.pref == pref;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, pref.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin IntPreferenceRef on AutoDisposeNotifierProviderRef<int> {
  /// The parameter `pref` of this provider.
  Preference<int> get pref;
}

class _IntPreferenceProviderElement
    extends AutoDisposeNotifierProviderElement<IntPreference, int>
    with IntPreferenceRef {
  _IntPreferenceProviderElement(super.provider);

  @override
  Preference<int> get pref => (origin as IntPreferenceProvider).pref;
}

String _$stringPreferenceHash() => r'b5f8bbb1d04af8798605c2d00c86e058bb0ba8a4';

abstract class _$StringPreference extends BuildlessAutoDisposeNotifier<String> {
  late final Preference<String> pref;

  String build(
    Preference<String> pref,
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
    Preference<String> pref,
  ) {
    return StringPreferenceProvider(
      pref,
    );
  }

  @override
  StringPreferenceProvider getProviderOverride(
    covariant StringPreferenceProvider provider,
  ) {
    return call(
      provider.pref,
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
    Preference<String> pref,
  ) : this._internal(
          () => StringPreference()..pref = pref,
          from: stringPreferenceProvider,
          name: r'stringPreferenceProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$stringPreferenceHash,
          dependencies: StringPreferenceFamily._dependencies,
          allTransitiveDependencies:
              StringPreferenceFamily._allTransitiveDependencies,
          pref: pref,
        );

  StringPreferenceProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.pref,
  }) : super.internal();

  final Preference<String> pref;

  @override
  String runNotifierBuild(
    covariant StringPreference notifier,
  ) {
    return notifier.build(
      pref,
    );
  }

  @override
  Override overrideWith(StringPreference Function() create) {
    return ProviderOverride(
      origin: this,
      override: StringPreferenceProvider._internal(
        () => create()..pref = pref,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        pref: pref,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<StringPreference, String> createElement() {
    return _StringPreferenceProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is StringPreferenceProvider && other.pref == pref;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, pref.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin StringPreferenceRef on AutoDisposeNotifierProviderRef<String> {
  /// The parameter `pref` of this provider.
  Preference<String> get pref;
}

class _StringPreferenceProviderElement
    extends AutoDisposeNotifierProviderElement<StringPreference, String>
    with StringPreferenceRef {
  _StringPreferenceProviderElement(super.provider);

  @override
  Preference<String> get pref => (origin as StringPreferenceProvider).pref;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
