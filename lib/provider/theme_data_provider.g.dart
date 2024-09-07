// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'theme_data_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$themeDataHash() => r'970ba3d53a67d92d21568111e5cd613ffd15680e';

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
class ThemeDataFamily extends Family<ThemeData> {
  /// See also [themeData].
  const ThemeDataFamily();

  /// See also [themeData].
  ThemeDataProvider call({
    bool isDarkMode = false,
  }) {
    return ThemeDataProvider(
      isDarkMode: isDarkMode,
    );
  }

  @override
  ThemeDataProvider getProviderOverride(
    covariant ThemeDataProvider provider,
  ) {
    return call(
      isDarkMode: provider.isDarkMode,
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
  String? get name => r'themeDataProvider';
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
    super._createNotifier, {
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
    ThemeData Function(ThemeDataRef provider) create,
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
  AutoDisposeProviderElement<ThemeData> createElement() {
    return _ThemeDataProviderElement(this);
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
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
