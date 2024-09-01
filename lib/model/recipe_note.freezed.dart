// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipe_note.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RecipeNote {
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  List<String> get foodList => throw _privateConstructorUsedError;
  List<String> get stepList => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;

  /// Create a copy of RecipeNote
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecipeNoteCopyWith<RecipeNote> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecipeNoteCopyWith<$Res> {
  factory $RecipeNoteCopyWith(
          RecipeNote value, $Res Function(RecipeNote) then) =
      _$RecipeNoteCopyWithImpl<$Res, RecipeNote>;
  @useResult
  $Res call(
      {String title,
      String description,
      List<String> foodList,
      List<String> stepList,
      DateTime createdAt,
      DateTime updatedAt,
      int? id});
}

/// @nodoc
class _$RecipeNoteCopyWithImpl<$Res, $Val extends RecipeNote>
    implements $RecipeNoteCopyWith<$Res> {
  _$RecipeNoteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RecipeNote
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
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
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
              as List<String>,
      stepList: null == stepList
          ? _value.stepList
          : stepList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RecipeNoteImplCopyWith<$Res>
    implements $RecipeNoteCopyWith<$Res> {
  factory _$$RecipeNoteImplCopyWith(
          _$RecipeNoteImpl value, $Res Function(_$RecipeNoteImpl) then) =
      __$$RecipeNoteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      String description,
      List<String> foodList,
      List<String> stepList,
      DateTime createdAt,
      DateTime updatedAt,
      int? id});
}

/// @nodoc
class __$$RecipeNoteImplCopyWithImpl<$Res>
    extends _$RecipeNoteCopyWithImpl<$Res, _$RecipeNoteImpl>
    implements _$$RecipeNoteImplCopyWith<$Res> {
  __$$RecipeNoteImplCopyWithImpl(
      _$RecipeNoteImpl _value, $Res Function(_$RecipeNoteImpl) _then)
      : super(_value, _then);

  /// Create a copy of RecipeNote
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
    Object? id = freezed,
  }) {
    return _then(_$RecipeNoteImpl(
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
              as List<String>,
      stepList: null == stepList
          ? _value._stepList
          : stepList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$RecipeNoteImpl implements _RecipeNote {
  const _$RecipeNoteImpl(
      {required this.title,
      required this.description,
      required final List<String> foodList,
      required final List<String> stepList,
      required this.createdAt,
      required this.updatedAt,
      this.id})
      : _foodList = foodList,
        _stepList = stepList;

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
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final int? id;

  @override
  String toString() {
    return 'RecipeNote(title: $title, description: $description, foodList: $foodList, stepList: $stepList, createdAt: $createdAt, updatedAt: $updatedAt, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecipeNoteImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._foodList, _foodList) &&
            const DeepCollectionEquality().equals(other._stepList, _stepList) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      title,
      description,
      const DeepCollectionEquality().hash(_foodList),
      const DeepCollectionEquality().hash(_stepList),
      createdAt,
      updatedAt,
      id);

  /// Create a copy of RecipeNote
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecipeNoteImplCopyWith<_$RecipeNoteImpl> get copyWith =>
      __$$RecipeNoteImplCopyWithImpl<_$RecipeNoteImpl>(this, _$identity);
}

abstract class _RecipeNote implements RecipeNote {
  const factory _RecipeNote(
      {required final String title,
      required final String description,
      required final List<String> foodList,
      required final List<String> stepList,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      final int? id}) = _$RecipeNoteImpl;

  @override
  String get title;
  @override
  String get description;
  @override
  List<String> get foodList;
  @override
  List<String> get stepList;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  int? get id;

  /// Create a copy of RecipeNote
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecipeNoteImplCopyWith<_$RecipeNoteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
