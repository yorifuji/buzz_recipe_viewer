// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_state_store.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SearchState {
  String get query;
  SortIndex get sortType;
  int get nextPage;
  List<SearchHit> get searchHits;

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SearchStateCopyWith<SearchState> get copyWith =>
      _$SearchStateCopyWithImpl<SearchState>(this as SearchState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SearchState &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.sortType, sortType) ||
                other.sortType == sortType) &&
            (identical(other.nextPage, nextPage) ||
                other.nextPage == nextPage) &&
            const DeepCollectionEquality()
                .equals(other.searchHits, searchHits));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query, sortType, nextPage,
      const DeepCollectionEquality().hash(searchHits));

  @override
  String toString() {
    return 'SearchState(query: $query, sortType: $sortType, nextPage: $nextPage, searchHits: $searchHits)';
  }
}

/// @nodoc
abstract mixin class $SearchStateCopyWith<$Res> {
  factory $SearchStateCopyWith(
          SearchState value, $Res Function(SearchState) _then) =
      _$SearchStateCopyWithImpl;
  @useResult
  $Res call(
      {String query,
      SortIndex sortType,
      int nextPage,
      List<SearchHit> searchHits});
}

/// @nodoc
class _$SearchStateCopyWithImpl<$Res> implements $SearchStateCopyWith<$Res> {
  _$SearchStateCopyWithImpl(this._self, this._then);

  final SearchState _self;
  final $Res Function(SearchState) _then;

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
    Object? sortType = null,
    Object? nextPage = null,
    Object? searchHits = null,
  }) {
    return _then(_self.copyWith(
      query: null == query
          ? _self.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      sortType: null == sortType
          ? _self.sortType
          : sortType // ignore: cast_nullable_to_non_nullable
              as SortIndex,
      nextPage: null == nextPage
          ? _self.nextPage
          : nextPage // ignore: cast_nullable_to_non_nullable
              as int,
      searchHits: null == searchHits
          ? _self.searchHits
          : searchHits // ignore: cast_nullable_to_non_nullable
              as List<SearchHit>,
    ));
  }
}

/// @nodoc

class _SearchState implements SearchState {
  const _SearchState(
      {this.query = '',
      this.sortType = SortIndex.timestamp,
      this.nextPage = 0,
      final List<SearchHit> searchHits = const <SearchHit>[]})
      : _searchHits = searchHits;

  @override
  @JsonKey()
  final String query;
  @override
  @JsonKey()
  final SortIndex sortType;
  @override
  @JsonKey()
  final int nextPage;
  final List<SearchHit> _searchHits;
  @override
  @JsonKey()
  List<SearchHit> get searchHits {
    if (_searchHits is EqualUnmodifiableListView) return _searchHits;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_searchHits);
  }

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SearchStateCopyWith<_SearchState> get copyWith =>
      __$SearchStateCopyWithImpl<_SearchState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SearchState &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.sortType, sortType) ||
                other.sortType == sortType) &&
            (identical(other.nextPage, nextPage) ||
                other.nextPage == nextPage) &&
            const DeepCollectionEquality()
                .equals(other._searchHits, _searchHits));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query, sortType, nextPage,
      const DeepCollectionEquality().hash(_searchHits));

  @override
  String toString() {
    return 'SearchState(query: $query, sortType: $sortType, nextPage: $nextPage, searchHits: $searchHits)';
  }
}

/// @nodoc
abstract mixin class _$SearchStateCopyWith<$Res>
    implements $SearchStateCopyWith<$Res> {
  factory _$SearchStateCopyWith(
          _SearchState value, $Res Function(_SearchState) _then) =
      __$SearchStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String query,
      SortIndex sortType,
      int nextPage,
      List<SearchHit> searchHits});
}

/// @nodoc
class __$SearchStateCopyWithImpl<$Res> implements _$SearchStateCopyWith<$Res> {
  __$SearchStateCopyWithImpl(this._self, this._then);

  final _SearchState _self;
  final $Res Function(_SearchState) _then;

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? query = null,
    Object? sortType = null,
    Object? nextPage = null,
    Object? searchHits = null,
  }) {
    return _then(_SearchState(
      query: null == query
          ? _self.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      sortType: null == sortType
          ? _self.sortType
          : sortType // ignore: cast_nullable_to_non_nullable
              as SortIndex,
      nextPage: null == nextPage
          ? _self.nextPage
          : nextPage // ignore: cast_nullable_to_non_nullable
              as int,
      searchHits: null == searchHits
          ? _self._searchHits
          : searchHits // ignore: cast_nullable_to_non_nullable
              as List<SearchHit>,
    ));
  }
}

// dart format on
