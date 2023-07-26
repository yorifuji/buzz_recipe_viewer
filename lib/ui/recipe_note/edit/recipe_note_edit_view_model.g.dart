// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'recipe_note_edit_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$recipeNoteEditViewModelHash() =>
    r'30255878cc7a4be08475cd0b426c5547e3d6b39f';

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
class RecipeNoteEditViewModelFamily extends Family<RecipeNoteEditState> {
  /// See also [RecipeNoteEditViewModel].
  const RecipeNoteEditViewModelFamily();

  /// See also [RecipeNoteEditViewModel].
  RecipeNoteEditViewModelProvider call({
    RecipeNote? recipeNote,
  }) {
    return RecipeNoteEditViewModelProvider(
      recipeNote: recipeNote,
    );
  }

  @override
  RecipeNoteEditViewModelProvider getProviderOverride(
    covariant RecipeNoteEditViewModelProvider provider,
  ) {
    return call(
      recipeNote: provider.recipeNote,
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
  String? get name => r'recipeNoteEditViewModelProvider';
}

/// See also [RecipeNoteEditViewModel].
class RecipeNoteEditViewModelProvider extends AutoDisposeNotifierProviderImpl<
    RecipeNoteEditViewModel, RecipeNoteEditState> {
  /// See also [RecipeNoteEditViewModel].
  RecipeNoteEditViewModelProvider({
    this.recipeNote,
  }) : super.internal(
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
        );

  final RecipeNote? recipeNote;

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

  @override
  RecipeNoteEditState runNotifierBuild(
    covariant RecipeNoteEditViewModel notifier,
  ) {
    return notifier.build(
      recipeNote: recipeNote,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
