// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'preference_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$preferenceNotifierHash() =>
    r'15163380ca54a899178b74da906224b3b87daa2d';

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

abstract class _$PreferenceNotifier<T> extends BuildlessAutoDisposeNotifier<T> {
  late final PreferenceKey<T> keyValue;

  T build(
    PreferenceKey<T> keyValue,
  );
}

/// See also [PreferenceNotifier].
@ProviderFor(PreferenceNotifier)
const preferenceNotifierProvider = PreferenceNotifierFamily();

/// See also [PreferenceNotifier].
class PreferenceNotifierFamily extends Family {
  /// See also [PreferenceNotifier].
  const PreferenceNotifierFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'preferenceNotifierProvider';

  /// See also [PreferenceNotifier].
  PreferenceNotifierProvider<T> call<T>(
    PreferenceKey<T> keyValue,
  ) {
    return PreferenceNotifierProvider<T>(
      keyValue,
    );
  }

  @visibleForOverriding
  @override
  PreferenceNotifierProvider<Object?> getProviderOverride(
    covariant PreferenceNotifierProvider<Object?> provider,
  ) {
    return call(
      provider.keyValue,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(PreferenceNotifier Function() create) {
    return _$PreferenceNotifierFamilyOverride(this, create);
  }
}

class _$PreferenceNotifierFamilyOverride implements FamilyOverride {
  _$PreferenceNotifierFamilyOverride(this.overriddenFamily, this.create);

  final PreferenceNotifier Function() create;

  @override
  final PreferenceNotifierFamily overriddenFamily;

  @override
  PreferenceNotifierProvider getProviderOverride(
    covariant PreferenceNotifierProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// See also [PreferenceNotifier].
class PreferenceNotifierProvider<T>
    extends AutoDisposeNotifierProviderImpl<PreferenceNotifier<T>, T> {
  /// See also [PreferenceNotifier].
  PreferenceNotifierProvider(
    PreferenceKey<T> keyValue,
  ) : this._internal(
          () => PreferenceNotifier<T>()..keyValue = keyValue,
          from: preferenceNotifierProvider,
          name: r'preferenceNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$preferenceNotifierHash,
          dependencies: PreferenceNotifierFamily._dependencies,
          allTransitiveDependencies:
              PreferenceNotifierFamily._allTransitiveDependencies,
          keyValue: keyValue,
        );

  PreferenceNotifierProvider._internal(
    super.create, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.keyValue,
  }) : super.internal();

  final PreferenceKey<T> keyValue;

  @override
  T runNotifierBuild(
    covariant PreferenceNotifier<T> notifier,
  ) {
    return notifier.build(
      keyValue,
    );
  }

  @override
  Override overrideWith(PreferenceNotifier<T> Function() create) {
    return ProviderOverride(
      origin: this,
      override: PreferenceNotifierProvider<T>._internal(
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
  (PreferenceKey<T>,) get argument {
    return (keyValue,);
  }

  @override
  AutoDisposeNotifierProviderElement<PreferenceNotifier<T>, T> createElement() {
    return _PreferenceNotifierProviderElement(this);
  }

  PreferenceNotifierProvider _copyWith(
    PreferenceNotifier Function() create,
  ) {
    return PreferenceNotifierProvider._internal(
      () => create()..keyValue = keyValue,
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
      keyValue: keyValue,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is PreferenceNotifierProvider &&
        other.runtimeType == runtimeType &&
        other.keyValue == keyValue;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, keyValue.hashCode);
    hash = _SystemHash.combine(hash, T.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin PreferenceNotifierRef<T> on AutoDisposeNotifierProviderRef<T> {
  /// The parameter `keyValue` of this provider.
  PreferenceKey<T> get keyValue;
}

class _PreferenceNotifierProviderElement<T>
    extends AutoDisposeNotifierProviderElement<PreferenceNotifier<T>, T>
    with PreferenceNotifierRef<T> {
  _PreferenceNotifierProviderElement(super.provider);

  @override
  PreferenceKey<T> get keyValue =>
      (origin as PreferenceNotifierProvider<T>).keyValue;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
