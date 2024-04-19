// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'theme_data_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$themeDataHash() => r'fd5ddbb56846a5a6a69189ba519a53cde0850372';

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

/// See also [themeData].
@ProviderFor(themeData)
const themeDataProvider = ThemeDataFamily();

/// See also [themeData].
class ThemeDataFamily extends Family {
  /// See also [themeData].
  const ThemeDataFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'themeDataProvider';

  /// See also [themeData].
  ThemeDataProvider call({
    bool isDarkMode = false,
  }) {
    return ThemeDataProvider(
      isDarkMode: isDarkMode,
    );
  }

  @visibleForOverriding
  @override
  ThemeDataProvider getProviderOverride(
    covariant ThemeDataProvider provider,
  ) {
    return call(
      isDarkMode: provider.isDarkMode,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(ThemeData Function(ThemeDataRef ref) create) {
    return _$ThemeDataFamilyOverride(this, create);
  }
}

class _$ThemeDataFamilyOverride implements FamilyOverride {
  _$ThemeDataFamilyOverride(this.overriddenFamily, this.create);

  final ThemeData Function(ThemeDataRef ref) create;

  @override
  final ThemeDataFamily overriddenFamily;

  @override
  ThemeDataProvider getProviderOverride(
    covariant ThemeDataProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// See also [themeData].
class ThemeDataProvider extends AutoDisposeProvider<ThemeData> {
  /// See also [themeData].
  ThemeDataProvider({
    bool isDarkMode = false,
  }) : this._internal(
          (ref) => themeData(
            ref as ThemeDataRef,
            isDarkMode: isDarkMode,
          ),
          from: themeDataProvider,
          name: r'themeDataProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$themeDataHash,
          dependencies: ThemeDataFamily._dependencies,
          allTransitiveDependencies: ThemeDataFamily._allTransitiveDependencies,
          isDarkMode: isDarkMode,
        );

  ThemeDataProvider._internal(
    super.create, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.isDarkMode,
  }) : super.internal();

  final bool isDarkMode;

  @override
  Override overrideWith(
    ThemeData Function(ThemeDataRef ref) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ThemeDataProvider._internal(
        (ref) => create(ref as ThemeDataRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        isDarkMode: isDarkMode,
      ),
    );
  }

  @override
  ({
    bool isDarkMode,
  }) get argument {
    return (isDarkMode: isDarkMode,);
  }

  @override
  AutoDisposeProviderElement<ThemeData> createElement() {
    return _ThemeDataProviderElement(this);
  }

  ThemeDataProvider _copyWith(
    ThemeData Function(ThemeDataRef ref) create,
  ) {
    return ThemeDataProvider._internal(
      (ref) => create(ref as ThemeDataRef),
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
      isDarkMode: isDarkMode,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ThemeDataProvider && other.isDarkMode == isDarkMode;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, isDarkMode.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ThemeDataRef on AutoDisposeProviderRef<ThemeData> {
  /// The parameter `isDarkMode` of this provider.
  bool get isDarkMode;
}

class _ThemeDataProviderElement extends AutoDisposeProviderElement<ThemeData>
    with ThemeDataRef {
  _ThemeDataProviderElement(super.provider);

  @override
  bool get isDarkMode => (origin as ThemeDataProvider).isDarkMode;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
