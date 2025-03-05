// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipe.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Recipe {
  String get title;
  String get description;
  List<String> get foodList;
  List<String> get stepList;
  @CreatedAtField()
  DateTime get createdAt;
  @UpdatedAtField()
  DateTime get updatedAt;
  List<StorageImage> get imageList;
  RecipeId get recipeId;

  /// Create a copy of Recipe
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RecipeCopyWith<Recipe> get copyWith =>
      _$RecipeCopyWithImpl<Recipe>(this as Recipe, _$identity);

  /// Serializes this Recipe to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Recipe &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other.foodList, foodList) &&
            const DeepCollectionEquality().equals(other.stepList, stepList) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            const DeepCollectionEquality().equals(other.imageList, imageList) &&
            (identical(other.recipeId, recipeId) ||
                other.recipeId == recipeId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      title,
      description,
      const DeepCollectionEquality().hash(foodList),
      const DeepCollectionEquality().hash(stepList),
      createdAt,
      updatedAt,
      const DeepCollectionEquality().hash(imageList),
      recipeId);

  @override
  String toString() {
    return 'Recipe(title: $title, description: $description, foodList: $foodList, stepList: $stepList, createdAt: $createdAt, updatedAt: $updatedAt, imageList: $imageList, recipeId: $recipeId)';
  }
}

/// @nodoc
abstract mixin class $RecipeCopyWith<$Res> {
  factory $RecipeCopyWith(Recipe value, $Res Function(Recipe) _then) =
      _$RecipeCopyWithImpl;
  @useResult
  $Res call(
      {String title,
      String description,
      List<String> foodList,
      List<String> stepList,
      @CreatedAtField() DateTime createdAt,
      @UpdatedAtField() DateTime updatedAt,
      List<StorageImage> imageList,
      RecipeId recipeId});
}

/// @nodoc
class _$RecipeCopyWithImpl<$Res> implements $RecipeCopyWith<$Res> {
  _$RecipeCopyWithImpl(this._self, this._then);

  final Recipe _self;
  final $Res Function(Recipe) _then;

  /// Create a copy of Recipe
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? foodList = null,
    Object? stepList = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? imageList = null,
    Object? recipeId = null,
  }) {
    return _then(_self.copyWith(
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
              as List<String>,
      stepList: null == stepList
          ? _self.stepList
          : stepList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      imageList: null == imageList
          ? _self.imageList
          : imageList // ignore: cast_nullable_to_non_nullable
              as List<StorageImage>,
      recipeId: null == recipeId
          ? _self.recipeId
          : recipeId // ignore: cast_nullable_to_non_nullable
              as RecipeId,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _Recipe implements Recipe {
  const _Recipe(
      {required this.title,
      required this.description,
      required final List<String> foodList,
      required final List<String> stepList,
      @CreatedAtField() required this.createdAt,
      @UpdatedAtField() required this.updatedAt,
      required final List<StorageImage> imageList,
      required this.recipeId})
      : _foodList = foodList,
        _stepList = stepList,
        _imageList = imageList;
  factory _Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);

  @override
  final String title;
  @override
  final String description;
  final List<String> _foodList;
  @override
  List<String> get foodList {
    if (_foodList is EqualUnmodifiableListView) return _foodList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_foodList);
  }

  final List<String> _stepList;
  @override
  List<String> get stepList {
    if (_stepList is EqualUnmodifiableListView) return _stepList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_stepList);
  }

  @override
  @CreatedAtField()
  final DateTime createdAt;
  @override
  @UpdatedAtField()
  final DateTime updatedAt;
  final List<StorageImage> _imageList;
  @override
  List<StorageImage> get imageList {
    if (_imageList is EqualUnmodifiableListView) return _imageList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_imageList);
  }

  @override
  final RecipeId recipeId;

  /// Create a copy of Recipe
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RecipeCopyWith<_Recipe> get copyWith =>
      __$RecipeCopyWithImpl<_Recipe>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RecipeToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Recipe &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._foodList, _foodList) &&
            const DeepCollectionEquality().equals(other._stepList, _stepList) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            const DeepCollectionEquality()
                .equals(other._imageList, _imageList) &&
            (identical(other.recipeId, recipeId) ||
                other.recipeId == recipeId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      title,
      description,
      const DeepCollectionEquality().hash(_foodList),
      const DeepCollectionEquality().hash(_stepList),
      createdAt,
      updatedAt,
      const DeepCollectionEquality().hash(_imageList),
      recipeId);

  @override
  String toString() {
    return 'Recipe(title: $title, description: $description, foodList: $foodList, stepList: $stepList, createdAt: $createdAt, updatedAt: $updatedAt, imageList: $imageList, recipeId: $recipeId)';
  }
}

/// @nodoc
abstract mixin class _$RecipeCopyWith<$Res> implements $RecipeCopyWith<$Res> {
  factory _$RecipeCopyWith(_Recipe value, $Res Function(_Recipe) _then) =
      __$RecipeCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String title,
      String description,
      List<String> foodList,
      List<String> stepList,
      @CreatedAtField() DateTime createdAt,
      @UpdatedAtField() DateTime updatedAt,
      List<StorageImage> imageList,
      RecipeId recipeId});
}

/// @nodoc
class __$RecipeCopyWithImpl<$Res> implements _$RecipeCopyWith<$Res> {
  __$RecipeCopyWithImpl(this._self, this._then);

  final _Recipe _self;
  final $Res Function(_Recipe) _then;

  /// Create a copy of Recipe
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? foodList = null,
    Object? stepList = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? imageList = null,
    Object? recipeId = null,
  }) {
    return _then(_Recipe(
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
              as List<String>,
      stepList: null == stepList
          ? _self._stepList
          : stepList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      imageList: null == imageList
          ? _self._imageList
          : imageList // ignore: cast_nullable_to_non_nullable
              as List<StorageImage>,
      recipeId: null == recipeId
          ? _self.recipeId
          : recipeId // ignore: cast_nullable_to_non_nullable
              as RecipeId,
    ));
  }
}

// dart format on
