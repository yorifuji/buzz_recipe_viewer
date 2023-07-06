// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'histories_page_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HistoriesState {
  List<History> get histories => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HistoriesStateCopyWith<HistoriesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HistoriesStateCopyWith<$Res> {
  factory $HistoriesStateCopyWith(
          HistoriesState value, $Res Function(HistoriesState) then) =
      _$HistoriesStateCopyWithImpl<$Res, HistoriesState>;
  @useResult
  $Res call({List<History> histories});
}

/// @nodoc
class _$HistoriesStateCopyWithImpl<$Res, $Val extends HistoriesState>
    implements $HistoriesStateCopyWith<$Res> {
  _$HistoriesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? histories = null,
  }) {
    return _then(_value.copyWith(
      histories: null == histories
          ? _value.histories
          : histories // ignore: cast_nullable_to_non_nullable
              as List<History>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HistoriesStateCopyWith<$Res>
    implements $HistoriesStateCopyWith<$Res> {
  factory _$$_HistoriesStateCopyWith(
          _$_HistoriesState value, $Res Function(_$_HistoriesState) then) =
      __$$_HistoriesStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<History> histories});
}

/// @nodoc
class __$$_HistoriesStateCopyWithImpl<$Res>
    extends _$HistoriesStateCopyWithImpl<$Res, _$_HistoriesState>
    implements _$$_HistoriesStateCopyWith<$Res> {
  __$$_HistoriesStateCopyWithImpl(
      _$_HistoriesState _value, $Res Function(_$_HistoriesState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? histories = null,
  }) {
    return _then(_$_HistoriesState(
      histories: null == histories
          ? _value._histories
          : histories // ignore: cast_nullable_to_non_nullable
              as List<History>,
    ));
  }
}

/// @nodoc

class _$_HistoriesState implements _HistoriesState {
  const _$_HistoriesState({final List<History> histories = const <History>[]})
      : _histories = histories;

  final List<History> _histories;
  @override
  @JsonKey()
  List<History> get histories {
    if (_histories is EqualUnmodifiableListView) return _histories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_histories);
  }

  @override
  String toString() {
    return 'HistoriesState(histories: $histories)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HistoriesState &&
            const DeepCollectionEquality()
                .equals(other._histories, _histories));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_histories));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HistoriesStateCopyWith<_$_HistoriesState> get copyWith =>
      __$$_HistoriesStateCopyWithImpl<_$_HistoriesState>(this, _$identity);
}

abstract class _HistoriesState implements HistoriesState {
  const factory _HistoriesState({final List<History> histories}) =
      _$_HistoriesState;

  @override
  List<History> get histories;
  @override
  @JsonKey(ignore: true)
  _$$_HistoriesStateCopyWith<_$_HistoriesState> get copyWith =>
      throw _privateConstructorUsedError;
}
