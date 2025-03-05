// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipe_edit_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TextItem {
  String get text;
  DateTime get dateTime;

  /// Create a copy of TextItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TextItemCopyWith<TextItem> get copyWith =>
      _$TextItemCopyWithImpl<TextItem>(this as TextItem, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TextItem &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.dateTime, dateTime) ||
                other.dateTime == dateTime));
  }

  @override
  int get hashCode => Object.hash(runtimeType, text, dateTime);

  @override
  String toString() {
    return 'TextItem(text: $text, dateTime: $dateTime)';
  }
}

/// @nodoc
abstract mixin class $TextItemCopyWith<$Res> {
  factory $TextItemCopyWith(TextItem value, $Res Function(TextItem) _then) =
      _$TextItemCopyWithImpl;
  @useResult
  $Res call({String text, DateTime dateTime});
}

/// @nodoc
class _$TextItemCopyWithImpl<$Res> implements $TextItemCopyWith<$Res> {
  _$TextItemCopyWithImpl(this._self, this._then);

  final TextItem _self;
  final $Res Function(TextItem) _then;

  /// Create a copy of TextItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? dateTime = null,
  }) {
    return _then(_self.copyWith(
      text: null == text
          ? _self.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      dateTime: null == dateTime
          ? _self.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _TextItem extends TextItem {
  const _TextItem({required this.text, required this.dateTime}) : super._();

  @override
  final String text;
  @override
  final DateTime dateTime;

  /// Create a copy of TextItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TextItemCopyWith<_TextItem> get copyWith =>
      __$TextItemCopyWithImpl<_TextItem>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TextItem &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.dateTime, dateTime) ||
                other.dateTime == dateTime));
  }

  @override
  int get hashCode => Object.hash(runtimeType, text, dateTime);

  @override
  String toString() {
    return 'TextItem(text: $text, dateTime: $dateTime)';
  }
}

/// @nodoc
abstract mixin class _$TextItemCopyWith<$Res>
    implements $TextItemCopyWith<$Res> {
  factory _$TextItemCopyWith(_TextItem value, $Res Function(_TextItem) _then) =
      __$TextItemCopyWithImpl;
  @override
  @useResult
  $Res call({String text, DateTime dateTime});
}

/// @nodoc
class __$TextItemCopyWithImpl<$Res> implements _$TextItemCopyWith<$Res> {
  __$TextItemCopyWithImpl(this._self, this._then);

  final _TextItem _self;
  final $Res Function(_TextItem) _then;

  /// Create a copy of TextItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? text = null,
    Object? dateTime = null,
  }) {
    return _then(_TextItem(
      text: null == text
          ? _self.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      dateTime: null == dateTime
          ? _self.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
mixin _$RecipeEditState {
  RecipeId get recipeId;
  Recipe? get recipe;
  String get title;
  String get description;
  List<TextItem> get foodList;
  List<TextItem> get stepList;
  List<StorageImage> get imageList;
  LoadingState get loadingState;

  /// Create a copy of RecipeEditState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RecipeEditStateCopyWith<RecipeEditState> get copyWith =>
      _$RecipeEditStateCopyWithImpl<RecipeEditState>(
          this as RecipeEditState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RecipeEditState &&
            (identical(other.recipeId, recipeId) ||
                other.recipeId == recipeId) &&
            (identical(other.recipe, recipe) || other.recipe == recipe) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other.foodList, foodList) &&
            const DeepCollectionEquality().equals(other.stepList, stepList) &&
            const DeepCollectionEquality().equals(other.imageList, imageList) &&
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
      const DeepCollectionEquality().hash(foodList),
      const DeepCollectionEquality().hash(stepList),
      const DeepCollectionEquality().hash(imageList),
      loadingState);

  @override
  String toString() {
    return 'RecipeEditState(recipeId: $recipeId, recipe: $recipe, title: $title, description: $description, foodList: $foodList, stepList: $stepList, imageList: $imageList, loadingState: $loadingState)';
  }
}

/// @nodoc
abstract mixin class $RecipeEditStateCopyWith<$Res> {
  factory $RecipeEditStateCopyWith(
          RecipeEditState value, $Res Function(RecipeEditState) _then) =
      _$RecipeEditStateCopyWithImpl;
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
class _$RecipeEditStateCopyWithImpl<$Res>
    implements $RecipeEditStateCopyWith<$Res> {
  _$RecipeEditStateCopyWithImpl(this._self, this._then);

  final RecipeEditState _self;
  final $Res Function(RecipeEditState) _then;

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
    return _then(_self.copyWith(
      recipeId: null == recipeId
          ? _self.recipeId
          : recipeId // ignore: cast_nullable_to_non_nullable
              as RecipeId,
      recipe: freezed == recipe
          ? _self.recipe
          : recipe // ignore: cast_nullable_to_non_nullable
              as Recipe?,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      foodList: null == foodList
          ? _self.foodList
          : foodList // ignore: cast_nullable_to_non_nullable
              as List<TextItem>,
      stepList: null == stepList
          ? _self.stepList
          : stepList // ignore: cast_nullable_to_non_nullable
              as List<TextItem>,
      imageList: null == imageList
          ? _self.imageList
          : imageList // ignore: cast_nullable_to_non_nullable
              as List<StorageImage>,
      loadingState: null == loadingState
          ? _self.loadingState
          : loadingState // ignore: cast_nullable_to_non_nullable
              as LoadingState,
    ));
  }

  /// Create a copy of RecipeEditState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RecipeCopyWith<$Res>? get recipe {
    if (_self.recipe == null) {
      return null;
    }

    return $RecipeCopyWith<$Res>(_self.recipe!, (value) {
      return _then(_self.copyWith(recipe: value));
    });
  }
}

/// @nodoc

class _RecipeEditState extends RecipeEditState {
  const _RecipeEditState(
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

  /// Create a copy of RecipeEditState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RecipeEditStateCopyWith<_RecipeEditState> get copyWith =>
      __$RecipeEditStateCopyWithImpl<_RecipeEditState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RecipeEditState &&
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

  @override
  String toString() {
    return 'RecipeEditState(recipeId: $recipeId, recipe: $recipe, title: $title, description: $description, foodList: $foodList, stepList: $stepList, imageList: $imageList, loadingState: $loadingState)';
  }
}

/// @nodoc
abstract mixin class _$RecipeEditStateCopyWith<$Res>
    implements $RecipeEditStateCopyWith<$Res> {
  factory _$RecipeEditStateCopyWith(
          _RecipeEditState value, $Res Function(_RecipeEditState) _then) =
      __$RecipeEditStateCopyWithImpl;
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
class __$RecipeEditStateCopyWithImpl<$Res>
    implements _$RecipeEditStateCopyWith<$Res> {
  __$RecipeEditStateCopyWithImpl(this._self, this._then);

  final _RecipeEditState _self;
  final $Res Function(_RecipeEditState) _then;

  /// Create a copy of RecipeEditState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
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
    return _then(_RecipeEditState(
      recipeId: null == recipeId
          ? _self.recipeId
          : recipeId // ignore: cast_nullable_to_non_nullable
              as RecipeId,
      recipe: freezed == recipe
          ? _self.recipe
          : recipe // ignore: cast_nullable_to_non_nullable
              as Recipe?,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      foodList: null == foodList
          ? _self._foodList
          : foodList // ignore: cast_nullable_to_non_nullable
              as List<TextItem>,
      stepList: null == stepList
          ? _self._stepList
          : stepList // ignore: cast_nullable_to_non_nullable
              as List<TextItem>,
      imageList: null == imageList
          ? _self._imageList
          : imageList // ignore: cast_nullable_to_non_nullable
              as List<StorageImage>,
      loadingState: null == loadingState
          ? _self.loadingState
          : loadingState // ignore: cast_nullable_to_non_nullable
              as LoadingState,
    ));
  }

  /// Create a copy of RecipeEditState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RecipeCopyWith<$Res>? get recipe {
    if (_self.recipe == null) {
      return null;
    }

    return $RecipeCopyWith<$Res>(_self.recipe!, (value) {
      return _then(_self.copyWith(recipe: value));
    });
  }
}

// dart format on
