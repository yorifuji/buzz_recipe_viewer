// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'search_hits_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SearchHitsState {
  String get query => throw _privateConstructorUsedError;
  AsyncValue<List<SearchHitItem>> get hitList =>
      throw _privateConstructorUsedError;
  SortIndex get sortType => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchHitsStateCopyWith<SearchHitsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchHitsStateCopyWith<$Res> {
  factory $SearchHitsStateCopyWith(
          SearchHitsState value, $Res Function(SearchHitsState) then) =
      _$SearchHitsStateCopyWithImpl<$Res>;
  $Res call(
      {String query,
      AsyncValue<List<SearchHitItem>> hitList,
      SortIndex sortType});
}

/// @nodoc
class _$SearchHitsStateCopyWithImpl<$Res>
    implements $SearchHitsStateCopyWith<$Res> {
  _$SearchHitsStateCopyWithImpl(this._value, this._then);

  final SearchHitsState _value;
  // ignore: unused_field
  final $Res Function(SearchHitsState) _then;

  @override
  $Res call({
    Object? query = freezed,
    Object? hitList = freezed,
    Object? sortType = freezed,
  }) {
    return _then(_value.copyWith(
      query: query == freezed
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      hitList: hitList == freezed
          ? _value.hitList
          : hitList // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<SearchHitItem>>,
      sortType: sortType == freezed
          ? _value.sortType
          : sortType // ignore: cast_nullable_to_non_nullable
              as SortIndex,
    ));
  }
}

/// @nodoc
abstract class _$$_SearchHitsStateCopyWith<$Res>
    implements $SearchHitsStateCopyWith<$Res> {
  factory _$$_SearchHitsStateCopyWith(
          _$_SearchHitsState value, $Res Function(_$_SearchHitsState) then) =
      __$$_SearchHitsStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String query,
      AsyncValue<List<SearchHitItem>> hitList,
      SortIndex sortType});
}

/// @nodoc
class __$$_SearchHitsStateCopyWithImpl<$Res>
    extends _$SearchHitsStateCopyWithImpl<$Res>
    implements _$$_SearchHitsStateCopyWith<$Res> {
  __$$_SearchHitsStateCopyWithImpl(
      _$_SearchHitsState _value, $Res Function(_$_SearchHitsState) _then)
      : super(_value, (v) => _then(v as _$_SearchHitsState));

  @override
  _$_SearchHitsState get _value => super._value as _$_SearchHitsState;

  @override
  $Res call({
    Object? query = freezed,
    Object? hitList = freezed,
    Object? sortType = freezed,
  }) {
    return _then(_$_SearchHitsState(
      query: query == freezed
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      hitList: hitList == freezed
          ? _value.hitList
          : hitList // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<SearchHitItem>>,
      sortType: sortType == freezed
          ? _value.sortType
          : sortType // ignore: cast_nullable_to_non_nullable
              as SortIndex,
    ));
  }
}

/// @nodoc

class _$_SearchHitsState implements _SearchHitsState {
  const _$_SearchHitsState(
      {this.query = '',
      this.hitList = const AsyncValue.loading(),
      this.sortType = SortIndex.timestamp});

  @override
  @JsonKey()
  final String query;
  @override
  @JsonKey()
  final AsyncValue<List<SearchHitItem>> hitList;
  @override
  @JsonKey()
  final SortIndex sortType;

  @override
  String toString() {
    return 'SearchHitsState(query: $query, hitList: $hitList, sortType: $sortType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SearchHitsState &&
            const DeepCollectionEquality().equals(other.query, query) &&
            const DeepCollectionEquality().equals(other.hitList, hitList) &&
            const DeepCollectionEquality().equals(other.sortType, sortType));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(query),
      const DeepCollectionEquality().hash(hitList),
      const DeepCollectionEquality().hash(sortType));

  @JsonKey(ignore: true)
  @override
  _$$_SearchHitsStateCopyWith<_$_SearchHitsState> get copyWith =>
      __$$_SearchHitsStateCopyWithImpl<_$_SearchHitsState>(this, _$identity);
}

abstract class _SearchHitsState implements SearchHitsState {
  const factory _SearchHitsState(
      {final String query,
      final AsyncValue<List<SearchHitItem>> hitList,
      final SortIndex sortType}) = _$_SearchHitsState;

  @override
  String get query;
  @override
  AsyncValue<List<SearchHitItem>> get hitList;
  @override
  SortIndex get sortType;
  @override
  @JsonKey(ignore: true)
  _$$_SearchHitsStateCopyWith<_$_SearchHitsState> get copyWith =>
      throw _privateConstructorUsedError;
}
