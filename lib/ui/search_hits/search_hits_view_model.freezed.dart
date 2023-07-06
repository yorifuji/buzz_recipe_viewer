// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
  List<SearchHitItem> get hitList => throw _privateConstructorUsedError;
  SortIndex get sortType => throw _privateConstructorUsedError;
  int get nextPage => throw _privateConstructorUsedError;
  LoadingState get loadingState => throw _privateConstructorUsedError;
  LoadingState get moreLoadingState => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchHitsStateCopyWith<SearchHitsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchHitsStateCopyWith<$Res> {
  factory $SearchHitsStateCopyWith(
          SearchHitsState value, $Res Function(SearchHitsState) then) =
      _$SearchHitsStateCopyWithImpl<$Res, SearchHitsState>;
  @useResult
  $Res call(
      {String query,
      List<SearchHitItem> hitList,
      SortIndex sortType,
      int nextPage,
      LoadingState loadingState,
      LoadingState moreLoadingState});
}

/// @nodoc
class _$SearchHitsStateCopyWithImpl<$Res, $Val extends SearchHitsState>
    implements $SearchHitsStateCopyWith<$Res> {
  _$SearchHitsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
    Object? hitList = null,
    Object? sortType = null,
    Object? nextPage = null,
    Object? loadingState = null,
    Object? moreLoadingState = null,
  }) {
    return _then(_value.copyWith(
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      hitList: null == hitList
          ? _value.hitList
          : hitList // ignore: cast_nullable_to_non_nullable
              as List<SearchHitItem>,
      sortType: null == sortType
          ? _value.sortType
          : sortType // ignore: cast_nullable_to_non_nullable
              as SortIndex,
      nextPage: null == nextPage
          ? _value.nextPage
          : nextPage // ignore: cast_nullable_to_non_nullable
              as int,
      loadingState: null == loadingState
          ? _value.loadingState
          : loadingState // ignore: cast_nullable_to_non_nullable
              as LoadingState,
      moreLoadingState: null == moreLoadingState
          ? _value.moreLoadingState
          : moreLoadingState // ignore: cast_nullable_to_non_nullable
              as LoadingState,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SearchHitsStateCopyWith<$Res>
    implements $SearchHitsStateCopyWith<$Res> {
  factory _$$_SearchHitsStateCopyWith(
          _$_SearchHitsState value, $Res Function(_$_SearchHitsState) then) =
      __$$_SearchHitsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String query,
      List<SearchHitItem> hitList,
      SortIndex sortType,
      int nextPage,
      LoadingState loadingState,
      LoadingState moreLoadingState});
}

/// @nodoc
class __$$_SearchHitsStateCopyWithImpl<$Res>
    extends _$SearchHitsStateCopyWithImpl<$Res, _$_SearchHitsState>
    implements _$$_SearchHitsStateCopyWith<$Res> {
  __$$_SearchHitsStateCopyWithImpl(
      _$_SearchHitsState _value, $Res Function(_$_SearchHitsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
    Object? hitList = null,
    Object? sortType = null,
    Object? nextPage = null,
    Object? loadingState = null,
    Object? moreLoadingState = null,
  }) {
    return _then(_$_SearchHitsState(
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      hitList: null == hitList
          ? _value._hitList
          : hitList // ignore: cast_nullable_to_non_nullable
              as List<SearchHitItem>,
      sortType: null == sortType
          ? _value.sortType
          : sortType // ignore: cast_nullable_to_non_nullable
              as SortIndex,
      nextPage: null == nextPage
          ? _value.nextPage
          : nextPage // ignore: cast_nullable_to_non_nullable
              as int,
      loadingState: null == loadingState
          ? _value.loadingState
          : loadingState // ignore: cast_nullable_to_non_nullable
              as LoadingState,
      moreLoadingState: null == moreLoadingState
          ? _value.moreLoadingState
          : moreLoadingState // ignore: cast_nullable_to_non_nullable
              as LoadingState,
    ));
  }
}

/// @nodoc

class _$_SearchHitsState implements _SearchHitsState {
  const _$_SearchHitsState(
      {this.query = '',
      final List<SearchHitItem> hitList = const <SearchHitItem>[],
      this.sortType = SortIndex.timestamp,
      this.nextPage = 0,
      this.loadingState = LoadingState.loadable,
      this.moreLoadingState = LoadingState.loadable})
      : _hitList = hitList;

  @override
  @JsonKey()
  final String query;
  final List<SearchHitItem> _hitList;
  @override
  @JsonKey()
  List<SearchHitItem> get hitList {
    if (_hitList is EqualUnmodifiableListView) return _hitList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hitList);
  }

  @override
  @JsonKey()
  final SortIndex sortType;
  @override
  @JsonKey()
  final int nextPage;
  @override
  @JsonKey()
  final LoadingState loadingState;
  @override
  @JsonKey()
  final LoadingState moreLoadingState;

  @override
  String toString() {
    return 'SearchHitsState(query: $query, hitList: $hitList, sortType: $sortType, nextPage: $nextPage, loadingState: $loadingState, moreLoadingState: $moreLoadingState)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SearchHitsState &&
            (identical(other.query, query) || other.query == query) &&
            const DeepCollectionEquality().equals(other._hitList, _hitList) &&
            (identical(other.sortType, sortType) ||
                other.sortType == sortType) &&
            (identical(other.nextPage, nextPage) ||
                other.nextPage == nextPage) &&
            (identical(other.loadingState, loadingState) ||
                other.loadingState == loadingState) &&
            (identical(other.moreLoadingState, moreLoadingState) ||
                other.moreLoadingState == moreLoadingState));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      query,
      const DeepCollectionEquality().hash(_hitList),
      sortType,
      nextPage,
      loadingState,
      moreLoadingState);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SearchHitsStateCopyWith<_$_SearchHitsState> get copyWith =>
      __$$_SearchHitsStateCopyWithImpl<_$_SearchHitsState>(this, _$identity);
}

abstract class _SearchHitsState implements SearchHitsState {
  const factory _SearchHitsState(
      {final String query,
      final List<SearchHitItem> hitList,
      final SortIndex sortType,
      final int nextPage,
      final LoadingState loadingState,
      final LoadingState moreLoadingState}) = _$_SearchHitsState;

  @override
  String get query;
  @override
  List<SearchHitItem> get hitList;
  @override
  SortIndex get sortType;
  @override
  int get nextPage;
  @override
  LoadingState get loadingState;
  @override
  LoadingState get moreLoadingState;
  @override
  @JsonKey(ignore: true)
  _$$_SearchHitsStateCopyWith<_$_SearchHitsState> get copyWith =>
      throw _privateConstructorUsedError;
}
