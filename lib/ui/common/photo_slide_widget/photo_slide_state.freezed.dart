// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'photo_slide_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PhotoSlideState implements DiagnosticableTreeMixin {
  List<ImageSource> get imageSources;

  /// Create a copy of PhotoSlideState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PhotoSlideStateCopyWith<PhotoSlideState> get copyWith =>
      _$PhotoSlideStateCopyWithImpl<PhotoSlideState>(
          this as PhotoSlideState, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'PhotoSlideState'))
      ..add(DiagnosticsProperty('imageSources', imageSources));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PhotoSlideState &&
            const DeepCollectionEquality()
                .equals(other.imageSources, imageSources));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(imageSources));

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PhotoSlideState(imageSources: $imageSources)';
  }
}

/// @nodoc
abstract mixin class $PhotoSlideStateCopyWith<$Res> {
  factory $PhotoSlideStateCopyWith(
          PhotoSlideState value, $Res Function(PhotoSlideState) _then) =
      _$PhotoSlideStateCopyWithImpl;
  @useResult
  $Res call({List<ImageSource> imageSources});
}

/// @nodoc
class _$PhotoSlideStateCopyWithImpl<$Res>
    implements $PhotoSlideStateCopyWith<$Res> {
  _$PhotoSlideStateCopyWithImpl(this._self, this._then);

  final PhotoSlideState _self;
  final $Res Function(PhotoSlideState) _then;

  /// Create a copy of PhotoSlideState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageSources = null,
  }) {
    return _then(_self.copyWith(
      imageSources: null == imageSources
          ? _self.imageSources
          : imageSources // ignore: cast_nullable_to_non_nullable
              as List<ImageSource>,
    ));
  }
}

/// @nodoc

class _PhotoSlideState extends PhotoSlideState with DiagnosticableTreeMixin {
  const _PhotoSlideState({final List<ImageSource> imageSources = const []})
      : _imageSources = imageSources,
        super._();

  final List<ImageSource> _imageSources;
  @override
  @JsonKey()
  List<ImageSource> get imageSources {
    if (_imageSources is EqualUnmodifiableListView) return _imageSources;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_imageSources);
  }

  /// Create a copy of PhotoSlideState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PhotoSlideStateCopyWith<_PhotoSlideState> get copyWith =>
      __$PhotoSlideStateCopyWithImpl<_PhotoSlideState>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'PhotoSlideState'))
      ..add(DiagnosticsProperty('imageSources', imageSources));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PhotoSlideState &&
            const DeepCollectionEquality()
                .equals(other._imageSources, _imageSources));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_imageSources));

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PhotoSlideState(imageSources: $imageSources)';
  }
}

/// @nodoc
abstract mixin class _$PhotoSlideStateCopyWith<$Res>
    implements $PhotoSlideStateCopyWith<$Res> {
  factory _$PhotoSlideStateCopyWith(
          _PhotoSlideState value, $Res Function(_PhotoSlideState) _then) =
      __$PhotoSlideStateCopyWithImpl;
  @override
  @useResult
  $Res call({List<ImageSource> imageSources});
}

/// @nodoc
class __$PhotoSlideStateCopyWithImpl<$Res>
    implements _$PhotoSlideStateCopyWith<$Res> {
  __$PhotoSlideStateCopyWithImpl(this._self, this._then);

  final _PhotoSlideState _self;
  final $Res Function(_PhotoSlideState) _then;

  /// Create a copy of PhotoSlideState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? imageSources = null,
  }) {
    return _then(_PhotoSlideState(
      imageSources: null == imageSources
          ? _self._imageSources
          : imageSources // ignore: cast_nullable_to_non_nullable
              as List<ImageSource>,
    ));
  }
}

// dart format on
