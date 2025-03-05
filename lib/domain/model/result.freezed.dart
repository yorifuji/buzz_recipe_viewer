// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Result<T, R> {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Result<T, R>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'Result<$T, $R>()';
  }
}

/// @nodoc
class $ResultCopyWith<T, R, $Res> {
  $ResultCopyWith(Result<T, R> _, $Res Function(Result<T, R>) __);
}

/// @nodoc

class Success<T, R> extends Result<T, R> {
  const Success({required this.data}) : super._();

  final T data;

  /// Create a copy of Result
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SuccessCopyWith<T, R, Success<T, R>> get copyWith =>
      _$SuccessCopyWithImpl<T, R, Success<T, R>>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Success<T, R> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @override
  String toString() {
    return 'Result<$T, $R>.success(data: $data)';
  }
}

/// @nodoc
abstract mixin class $SuccessCopyWith<T, R, $Res>
    implements $ResultCopyWith<T, R, $Res> {
  factory $SuccessCopyWith(
          Success<T, R> value, $Res Function(Success<T, R>) _then) =
      _$SuccessCopyWithImpl;
  @useResult
  $Res call({T data});
}

/// @nodoc
class _$SuccessCopyWithImpl<T, R, $Res>
    implements $SuccessCopyWith<T, R, $Res> {
  _$SuccessCopyWithImpl(this._self, this._then);

  final Success<T, R> _self;
  final $Res Function(Success<T, R>) _then;

  /// Create a copy of Result
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? data = freezed,
  }) {
    return _then(Success<T, R>(
      data: freezed == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class Failure<T, R> extends Result<T, R> {
  const Failure({required this.error}) : super._();

  final R error;

  /// Create a copy of Result
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FailureCopyWith<T, R, Failure<T, R>> get copyWith =>
      _$FailureCopyWithImpl<T, R, Failure<T, R>>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Failure<T, R> &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @override
  String toString() {
    return 'Result<$T, $R>.failure(error: $error)';
  }
}

/// @nodoc
abstract mixin class $FailureCopyWith<T, R, $Res>
    implements $ResultCopyWith<T, R, $Res> {
  factory $FailureCopyWith(
          Failure<T, R> value, $Res Function(Failure<T, R>) _then) =
      _$FailureCopyWithImpl;
  @useResult
  $Res call({R error});
}

/// @nodoc
class _$FailureCopyWithImpl<T, R, $Res>
    implements $FailureCopyWith<T, R, $Res> {
  _$FailureCopyWithImpl(this._self, this._then);

  final Failure<T, R> _self;
  final $Res Function(Failure<T, R>) _then;

  /// Create a copy of Result
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? error = freezed,
  }) {
    return _then(Failure<T, R>(
      error: freezed == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as R,
    ));
  }
}

// dart format on
