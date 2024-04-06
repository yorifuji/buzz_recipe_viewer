// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipe_note_edit_view_model.dart';

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

  @JsonKey(ignore: true)
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

  @JsonKey(ignore: true)
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
  @override
  @JsonKey(ignore: true)
  _$$TextItemImplCopyWith<_$TextItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$RecipeNoteEditState {
  RecipeNote? get recipeNote => throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  List<TextItem> get foodList => throw _privateConstructorUsedError;
  List<TextItem> get stepList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RecipeNoteEditStateCopyWith<RecipeNoteEditState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecipeNoteEditStateCopyWith<$Res> {
  factory $RecipeNoteEditStateCopyWith(
          RecipeNoteEditState value, $Res Function(RecipeNoteEditState) then) =
      _$RecipeNoteEditStateCopyWithImpl<$Res, RecipeNoteEditState>;
  @useResult
  $Res call(
      {RecipeNote? recipeNote,
      int? id,
      String title,
      String description,
      List<TextItem> foodList,
      List<TextItem> stepList});

  $RecipeNoteCopyWith<$Res>? get recipeNote;
}

/// @nodoc
class _$RecipeNoteEditStateCopyWithImpl<$Res, $Val extends RecipeNoteEditState>
    implements $RecipeNoteEditStateCopyWith<$Res> {
  _$RecipeNoteEditStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recipeNote = freezed,
    Object? id = freezed,
    Object? title = null,
    Object? description = null,
    Object? foodList = null,
    Object? stepList = null,
  }) {
    return _then(_value.copyWith(
      recipeNote: freezed == recipeNote
          ? _value.recipeNote
          : recipeNote // ignore: cast_nullable_to_non_nullable
              as RecipeNote?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
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
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RecipeNoteCopyWith<$Res>? get recipeNote {
    if (_value.recipeNote == null) {
      return null;
    }

    return $RecipeNoteCopyWith<$Res>(_value.recipeNote!, (value) {
      return _then(_value.copyWith(recipeNote: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RecipeNoteEditStateImplCopyWith<$Res>
    implements $RecipeNoteEditStateCopyWith<$Res> {
  factory _$$RecipeNoteEditStateImplCopyWith(_$RecipeNoteEditStateImpl value,
          $Res Function(_$RecipeNoteEditStateImpl) then) =
      __$$RecipeNoteEditStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {RecipeNote? recipeNote,
      int? id,
      String title,
      String description,
      List<TextItem> foodList,
      List<TextItem> stepList});

  @override
  $RecipeNoteCopyWith<$Res>? get recipeNote;
}

/// @nodoc
class __$$RecipeNoteEditStateImplCopyWithImpl<$Res>
    extends _$RecipeNoteEditStateCopyWithImpl<$Res, _$RecipeNoteEditStateImpl>
    implements _$$RecipeNoteEditStateImplCopyWith<$Res> {
  __$$RecipeNoteEditStateImplCopyWithImpl(_$RecipeNoteEditStateImpl _value,
      $Res Function(_$RecipeNoteEditStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recipeNote = freezed,
    Object? id = freezed,
    Object? title = null,
    Object? description = null,
    Object? foodList = null,
    Object? stepList = null,
  }) {
    return _then(_$RecipeNoteEditStateImpl(
      recipeNote: freezed == recipeNote
          ? _value.recipeNote
          : recipeNote // ignore: cast_nullable_to_non_nullable
              as RecipeNote?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
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
    ));
  }
}

/// @nodoc

class _$RecipeNoteEditStateImpl extends _RecipeNoteEditState {
  const _$RecipeNoteEditStateImpl(
      {this.recipeNote,
      this.id,
      this.title = '',
      this.description = '',
      final List<TextItem> foodList = const [],
      final List<TextItem> stepList = const []})
      : _foodList = foodList,
        _stepList = stepList,
        super._();

  @override
  final RecipeNote? recipeNote;
  @override
  final int? id;
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

  @override
  String toString() {
    return 'RecipeNoteEditState(recipeNote: $recipeNote, id: $id, title: $title, description: $description, foodList: $foodList, stepList: $stepList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecipeNoteEditStateImpl &&
            (identical(other.recipeNote, recipeNote) ||
                other.recipeNote == recipeNote) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._foodList, _foodList) &&
            const DeepCollectionEquality().equals(other._stepList, _stepList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      recipeNote,
      id,
      title,
      description,
      const DeepCollectionEquality().hash(_foodList),
      const DeepCollectionEquality().hash(_stepList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RecipeNoteEditStateImplCopyWith<_$RecipeNoteEditStateImpl> get copyWith =>
      __$$RecipeNoteEditStateImplCopyWithImpl<_$RecipeNoteEditStateImpl>(
          this, _$identity);
}

abstract class _RecipeNoteEditState extends RecipeNoteEditState {
  const factory _RecipeNoteEditState(
      {final RecipeNote? recipeNote,
      final int? id,
      final String title,
      final String description,
      final List<TextItem> foodList,
      final List<TextItem> stepList}) = _$RecipeNoteEditStateImpl;
  const _RecipeNoteEditState._() : super._();

  @override
  RecipeNote? get recipeNote;
  @override
  int? get id;
  @override
  String get title;
  @override
  String get description;
  @override
  List<TextItem> get foodList;
  @override
  List<TextItem> get stepList;
  @override
  @JsonKey(ignore: true)
  _$$RecipeNoteEditStateImplCopyWith<_$RecipeNoteEditStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
