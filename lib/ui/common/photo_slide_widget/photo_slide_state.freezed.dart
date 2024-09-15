// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'photo_slide_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PhotoSlideState {
  List<String> get urls => throw _privateConstructorUsedError;
  List<XFile> get files => throw _privateConstructorUsedError;

  /// Create a copy of PhotoSlideState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PhotoSlideStateCopyWith<PhotoSlideState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhotoSlideStateCopyWith<$Res> {
  factory $PhotoSlideStateCopyWith(
          PhotoSlideState value, $Res Function(PhotoSlideState) then) =
      _$PhotoSlideStateCopyWithImpl<$Res, PhotoSlideState>;
  @useResult
  $Res call({List<String> urls, List<XFile> files});
}

/// @nodoc
class _$PhotoSlideStateCopyWithImpl<$Res, $Val extends PhotoSlideState>
    implements $PhotoSlideStateCopyWith<$Res> {
  _$PhotoSlideStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PhotoSlideState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? urls = null,
    Object? files = null,
  }) {
    return _then(_value.copyWith(
      urls: null == urls
          ? _value.urls
          : urls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      files: null == files
          ? _value.files
          : files // ignore: cast_nullable_to_non_nullable
              as List<XFile>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PhotoSlideStateImplCopyWith<$Res>
    implements $PhotoSlideStateCopyWith<$Res> {
  factory _$$PhotoSlideStateImplCopyWith(_$PhotoSlideStateImpl value,
          $Res Function(_$PhotoSlideStateImpl) then) =
      __$$PhotoSlideStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String> urls, List<XFile> files});
}

/// @nodoc
class __$$PhotoSlideStateImplCopyWithImpl<$Res>
    extends _$PhotoSlideStateCopyWithImpl<$Res, _$PhotoSlideStateImpl>
    implements _$$PhotoSlideStateImplCopyWith<$Res> {
  __$$PhotoSlideStateImplCopyWithImpl(
      _$PhotoSlideStateImpl _value, $Res Function(_$PhotoSlideStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of PhotoSlideState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? urls = null,
    Object? files = null,
  }) {
    return _then(_$PhotoSlideStateImpl(
      urls: null == urls
          ? _value._urls
          : urls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      files: null == files
          ? _value._files
          : files // ignore: cast_nullable_to_non_nullable
              as List<XFile>,
    ));
  }
}

/// @nodoc

class _$PhotoSlideStateImpl extends _PhotoSlideState {
  const _$PhotoSlideStateImpl(
      {final List<String> urls = const [], final List<XFile> files = const []})
      : _urls = urls,
        _files = files,
        super._();

  final List<String> _urls;
  @override
  @JsonKey()
  List<String> get urls {
    if (_urls is EqualUnmodifiableListView) return _urls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_urls);
  }

  final List<XFile> _files;
  @override
  @JsonKey()
  List<XFile> get files {
    if (_files is EqualUnmodifiableListView) return _files;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_files);
  }

  @override
  String toString() {
    return 'PhotoSlideState(urls: $urls, files: $files)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PhotoSlideStateImpl &&
            const DeepCollectionEquality().equals(other._urls, _urls) &&
            const DeepCollectionEquality().equals(other._files, _files));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_urls),
      const DeepCollectionEquality().hash(_files));

  /// Create a copy of PhotoSlideState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PhotoSlideStateImplCopyWith<_$PhotoSlideStateImpl> get copyWith =>
      __$$PhotoSlideStateImplCopyWithImpl<_$PhotoSlideStateImpl>(
          this, _$identity);
}

abstract class _PhotoSlideState extends PhotoSlideState {
  const factory _PhotoSlideState(
      {final List<String> urls,
      final List<XFile> files}) = _$PhotoSlideStateImpl;
  const _PhotoSlideState._() : super._();

  @override
  List<String> get urls;
  @override
  List<XFile> get files;

  /// Create a copy of PhotoSlideState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PhotoSlideStateImplCopyWith<_$PhotoSlideStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
