// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipe_edit_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TextItem {
  String get text => throw _privateConstructorUsedError;
  DateTime get dateTime => throw _privateConstructorUsedError;

  /// Create a copy of TextItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TextItemCopyWith<TextItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TextItemCopyWith<$Res> {
  factory $TextItemCopyWith(TextItem value, $Res Function(TextItem) then) =
      _$TextItemCopyWithImpl<$Res, TextItem>;
  @useResult
  $Res call({String text, DateTime dateTime});
}

/// @nodoc
class _$TextItemCopyWithImpl<$Res, $Val extends TextItem>
    implements $TextItemCopyWith<$Res> {
  _$TextItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TextItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? dateTime = null,
  }) {
    return _then(_value.copyWith(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      dateTime: null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TextItemImplCopyWith<$Res>
    implements $TextItemCopyWith<$Res> {
  factory _$$TextItemImplCopyWith(
          _$TextItemImpl value, $Res Function(_$TextItemImpl) then) =
      __$$TextItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String text, DateTime dateTime});
}

/// @nodoc
class __$$TextItemImplCopyWithImpl<$Res>
    extends _$TextItemCopyWithImpl<$Res, _$TextItemImpl>
    implements _$$TextItemImplCopyWith<$Res> {
  __$$TextItemImplCopyWithImpl(
      _$TextItemImpl _value, $Res Function(_$TextItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of TextItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? dateTime = null,
  }) {
    return _then(_$TextItemImpl(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      dateTime: null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$TextItemImpl extends _TextItem {
  const _$TextItemImpl({required this.text, required this.dateTime})
      : super._();

  @override
  final String text;
  @override
  final DateTime dateTime;

  @override
  String toString() {
    return 'TextItem(text: $text, dateTime: $dateTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TextItemImpl &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.dateTime, dateTime) ||
                other.dateTime == dateTime));
  }

  @override
  int get hashCode => Object.hash(runtimeType, text, dateTime);

  /// Create a copy of TextItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TextItemImplCopyWith<_$TextItemImpl> get copyWith =>
      __$$TextItemImplCopyWithImpl<_$TextItemImpl>(this, _$identity);
}

abstract class _TextItem extends TextItem {
  const factory _TextItem(
      {required final String text,
      required final DateTime dateTime}) = _$TextItemImpl;
  const _TextItem._() : super._();

  @override
  String get text;
  @override
  DateTime get dateTime;

  /// Create a copy of TextItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TextItemImplCopyWith<_$TextItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$RecipeEditState {
  RecipeId get recipeId => throw _privateConstructorUsedError;
  Recipe? get recipe => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  List<TextItem> get foodList => throw _privateConstructorUsedError;
  List<TextItem> get stepList => throw _privateConstructorUsedError;
  List<StorageImage> get imageList => throw _privateConstructorUsedError;
  LoadingState get loadingState => throw _privateConstructorUsedError;

  /// Create a copy of RecipeEditState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecipeEditStateCopyWith<RecipeEditState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecipeEditStateCopyWith<$Res> {
  factory $RecipeEditStateCopyWith(
          RecipeEditState value, $Res Function(RecipeEditState) then) =
      _$RecipeEditStateCopyWithImpl<$Res, RecipeEditState>;
  @useResult
  $Res call(
      {RecipeId recipeId,
      Recipe? recipe,
      String title,
      String description,
      List<TextItem> foodList,
      List<TextItem> stepList,
      List<StorageImage> imageList,
      LoadingState loadingState});

  $RecipeCopyWith<$Res>? get recipe;
}

/// @nodoc
class _$RecipeEditStateCopyWithImpl<$Res, $Val extends RecipeEditState>
    implements $RecipeEditStateCopyWith<$Res> {
  _$RecipeEditStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RecipeEditState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recipeId = null,
    Object? recipe = freezed,
    Object? title = null,
    Object? description = null,
    Object? foodList = null,
    Object? stepList = null,
    Object? imageList = null,
    Object? loadingState = null,
  }) {
    return _then(_value.copyWith(
      recipeId: null == recipeId
          ? _value.recipeId
          : recipeId // ignore: cast_nullable_to_non_nullable
              as RecipeId,
      recipe: freezed == recipe
          ? _value.recipe
          : recipe // ignore: cast_nullable_to_non_nullable
              as Recipe?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      foodList: null == foodList
          ? _value.foodList
          : foodList // ignore: cast_nullable_to_non_nullable
              as List<TextItem>,
      stepList: null == stepList
          ? _value.stepList
          : stepList // ignore: cast_nullable_to_non_nullable
              as List<TextItem>,
      imageList: null == imageList
          ? _value.imageList
          : imageList // ignore: cast_nullable_to_non_nullable
              as List<StorageImage>,
      loadingState: null == loadingState
          ? _value.loadingState
          : loadingState // ignore: cast_nullable_to_non_nullable
              as LoadingState,
    ) as $Val);
  }

  /// Create a copy of RecipeEditState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RecipeCopyWith<$Res>? get recipe {
    if (_value.recipe == null) {
      return null;
    }

    return $RecipeCopyWith<$Res>(_value.recipe!, (value) {
      return _then(_value.copyWith(recipe: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RecipeEditStateImplCopyWith<$Res>
    implements $RecipeEditStateCopyWith<$Res> {
  factory _$$RecipeEditStateImplCopyWith(_$RecipeEditStateImpl value,
          $Res Function(_$RecipeEditStateImpl) then) =
      __$$RecipeEditStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {RecipeId recipeId,
      Recipe? recipe,
      String title,
      String description,
      List<TextItem> foodList,
      List<TextItem> stepList,
      List<StorageImage> imageList,
      LoadingState loadingState});

  @override
  $RecipeCopyWith<$Res>? get recipe;
}

/// @nodoc
class __$$RecipeEditStateImplCopyWithImpl<$Res>
    extends _$RecipeEditStateCopyWithImpl<$Res, _$RecipeEditStateImpl>
    implements _$$RecipeEditStateImplCopyWith<$Res> {
  __$$RecipeEditStateImplCopyWithImpl(
      _$RecipeEditStateImpl _value, $Res Function(_$RecipeEditStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of RecipeEditState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recipeId = null,
    Object? recipe = freezed,
    Object? title = null,
    Object? description = null,
    Object? foodList = null,
    Object? stepList = null,
    Object? imageList = null,
    Object? loadingState = null,
  }) {
    return _then(_$RecipeEditStateImpl(
      recipeId: null == recipeId
          ? _value.recipeId
          : recipeId // ignore: cast_nullable_to_non_nullable
              as RecipeId,
      recipe: freezed == recipe
          ? _value.recipe
          : recipe // ignore: cast_nullable_to_non_nullable
              as Recipe?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      foodList: null == foodList
          ? _value._foodList
          : foodList // ignore: cast_nullable_to_non_nullable
              as List<TextItem>,
      stepList: null == stepList
          ? _value._stepList
          : stepList // ignore: cast_nullable_to_non_nullable
              as List<TextItem>,
      imageList: null == imageList
          ? _value._imageList
          : imageList // ignore: cast_nullable_to_non_nullable
              as List<StorageImage>,
      loadingState: null == loadingState
          ? _value.loadingState
          : loadingState // ignore: cast_nullable_to_non_nullable
              as LoadingState,
    ));
  }
}

/// @nodoc

class _$RecipeEditStateImpl extends _RecipeEditState {
  const _$RecipeEditStateImpl(
      {required this.recipeId,
      this.recipe,
      this.title = '',
      this.description = '',
      final List<TextItem> foodList = const [],
      final List<TextItem> stepList = const [],
      final List<StorageImage> imageList = const [],
      this.loadingState = LoadingState.loadable})
      : _foodList = foodList,
        _stepList = stepList,
        _imageList = imageList,
        super._();

  @override
  final RecipeId recipeId;
  @override
  final Recipe? recipe;
  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String description;
  final List<TextItem> _foodList;
  @override
  @JsonKey()
  List<TextItem> get foodList {
    if (_foodList is EqualUnmodifiableListView) return _foodList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_foodList);
  }

  final List<TextItem> _stepList;
  @override
  @JsonKey()
  List<TextItem> get stepList {
    if (_stepList is EqualUnmodifiableListView) return _stepList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_stepList);
  }

  final List<StorageImage> _imageList;
  @override
  @JsonKey()
  List<StorageImage> get imageList {
    if (_imageList is EqualUnmodifiableListView) return _imageList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_imageList);
  }

  @override
  @JsonKey()
  final LoadingState loadingState;

  @override
  String toString() {
    return 'RecipeEditState(recipeId: $recipeId, recipe: $recipe, title: $title, description: $description, foodList: $foodList, stepList: $stepList, imageList: $imageList, loadingState: $loadingState)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecipeEditStateImpl &&
            (identical(other.recipeId, recipeId) ||
                other.recipeId == recipeId) &&
            (identical(other.recipe, recipe) || other.recipe == recipe) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._foodList, _foodList) &&
            const DeepCollectionEquality().equals(other._stepList, _stepList) &&
            const DeepCollectionEquality()
                .equals(other._imageList, _imageList) &&
            (identical(other.loadingState, loadingState) ||
                other.loadingState == loadingState));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      recipeId,
      recipe,
      title,
      description,
      const DeepCollectionEquality().hash(_foodList),
      const DeepCollectionEquality().hash(_stepList),
      const DeepCollectionEquality().hash(_imageList),
      loadingState);

  /// Create a copy of RecipeEditState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecipeEditStateImplCopyWith<_$RecipeEditStateImpl> get copyWith =>
      __$$RecipeEditStateImplCopyWithImpl<_$RecipeEditStateImpl>(
          this, _$identity);
}

abstract class _RecipeEditState extends RecipeEditState {
  const factory _RecipeEditState(
      {required final RecipeId recipeId,
      final Recipe? recipe,
      final String title,
      final String description,
      final List<TextItem> foodList,
      final List<TextItem> stepList,
      final List<StorageImage> imageList,
      final LoadingState loadingState}) = _$RecipeEditStateImpl;
  const _RecipeEditState._() : super._();

  @override
  RecipeId get recipeId;
  @override
  Recipe? get recipe;
  @override
  String get title;
  @override
  String get description;
  @override
  List<TextItem> get foodList;
  @override
  List<TextItem> get stepList;
  @override
  List<StorageImage> get imageList;
  @override
  LoadingState get loadingState;

  /// Create a copy of RecipeEditState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecipeEditStateImplCopyWith<_$RecipeEditStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
