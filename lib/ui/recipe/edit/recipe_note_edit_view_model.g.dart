// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'recipe_note_edit_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$recipeNoteEditViewModelHash() =>
    r'869350cceb3ad340d5ec9f844e7cab3b821b6bb8';

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

abstract class _$RecipeNoteEditViewModel
    extends BuildlessAutoDisposeNotifier<RecipeNoteEditState> {
  late final RecipeNote? recipeNote;

  RecipeNoteEditState build({
    RecipeNote? recipeNote,
  });
}

/// See also [RecipeNoteEditViewModel].
@ProviderFor(RecipeNoteEditViewModel)
const recipeNoteEditViewModelProvider = RecipeNoteEditViewModelFamily();

/// See also [RecipeNoteEditViewModel].
class RecipeNoteEditViewModelFamily extends Family {
  /// See also [RecipeNoteEditViewModel].
  const RecipeNoteEditViewModelFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'recipeNoteEditViewModelProvider';

  /// See also [RecipeNoteEditViewModel].
  RecipeNoteEditViewModelProvider call({
    RecipeNote? recipeNote,
  }) {
    return RecipeNoteEditViewModelProvider(
      recipeNote: recipeNote,
    );
  }

  @visibleForOverriding
  @override
  RecipeNoteEditViewModelProvider getProviderOverride(
    covariant RecipeNoteEditViewModelProvider provider,
  ) {
    return call(
      recipeNote: provider.recipeNote,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(RecipeNoteEditViewModel Function() create) {
    return _$RecipeNoteEditViewModelFamilyOverride(this, create);
  }
}

class _$RecipeNoteEditViewModelFamilyOverride implements FamilyOverride {
  _$RecipeNoteEditViewModelFamilyOverride(this.overriddenFamily, this.create);

  final RecipeNoteEditViewModel Function() create;

  @override
  final RecipeNoteEditViewModelFamily overriddenFamily;

  @override
  RecipeNoteEditViewModelProvider getProviderOverride(
    covariant RecipeNoteEditViewModelProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// See also [RecipeNoteEditViewModel].
class RecipeNoteEditViewModelProvider extends AutoDisposeNotifierProviderImpl<
    RecipeNoteEditViewModel, RecipeNoteEditState> {
  /// See also [RecipeNoteEditViewModel].
  RecipeNoteEditViewModelProvider({
    RecipeNote? recipeNote,
  }) : this._internal(
          () => RecipeNoteEditViewModel()..recipeNote = recipeNote,
          from: recipeNoteEditViewModelProvider,
          name: r'recipeNoteEditViewModelProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$recipeNoteEditViewModelHash,
          dependencies: RecipeNoteEditViewModelFamily._dependencies,
          allTransitiveDependencies:
              RecipeNoteEditViewModelFamily._allTransitiveDependencies,
          recipeNote: recipeNote,
        );

  RecipeNoteEditViewModelProvider._internal(
    super.create, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.recipeNote,
  }) : super.internal();

  final RecipeNote? recipeNote;

  @override
  RecipeNoteEditState runNotifierBuild(
    covariant RecipeNoteEditViewModel notifier,
  ) {
    return notifier.build(
      recipeNote: recipeNote,
    );
  }

  @override
  Override overrideWith(RecipeNoteEditViewModel Function() create) {
    return ProviderOverride(
      origin: this,
      override: RecipeNoteEditViewModelProvider._internal(
        () => create()..recipeNote = recipeNote,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        recipeNote: recipeNote,
      ),
    );
  }

  @override
  ({
    RecipeNote? recipeNote,
  }) get argument {
    return (recipeNote: recipeNote,);
  }

  @override
  AutoDisposeNotifierProviderElement<RecipeNoteEditViewModel,
      RecipeNoteEditState> createElement() {
    return _RecipeNoteEditViewModelProviderElement(this);
  }

  RecipeNoteEditViewModelProvider _copyWith(
    RecipeNoteEditViewModel Function() create,
  ) {
    return RecipeNoteEditViewModelProvider._internal(
      () => create()..recipeNote = recipeNote,
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
      recipeNote: recipeNote,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is RecipeNoteEditViewModelProvider &&
        other.recipeNote == recipeNote;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, recipeNote.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin RecipeNoteEditViewModelRef
    on AutoDisposeNotifierProviderRef<RecipeNoteEditState> {
  /// The parameter `recipeNote` of this provider.
  RecipeNote? get recipeNote;
}

class _RecipeNoteEditViewModelProviderElement
    extends AutoDisposeNotifierProviderElement<RecipeNoteEditViewModel,
        RecipeNoteEditState> with RecipeNoteEditViewModelRef {
  _RecipeNoteEditViewModelProviderElement(super.provider);

  @override
  RecipeNote? get recipeNote =>
      (origin as RecipeNoteEditViewModelProvider).recipeNote;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
