// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SearchRequest {
  String? get query;
  int? get page;
  int? get nextPage;
  int? get hitsPerPage;

  /// Create a copy of SearchRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SearchRequestCopyWith<SearchRequest> get copyWith =>
      _$SearchRequestCopyWithImpl<SearchRequest>(
          this as SearchRequest, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SearchRequest &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.nextPage, nextPage) ||
                other.nextPage == nextPage) &&
            (identical(other.hitsPerPage, hitsPerPage) ||
                other.hitsPerPage == hitsPerPage));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, query, page, nextPage, hitsPerPage);

  @override
  String toString() {
    return 'SearchRequest(query: $query, page: $page, nextPage: $nextPage, hitsPerPage: $hitsPerPage)';
  }
}

/// @nodoc
abstract mixin class $SearchRequestCopyWith<$Res> {
  factory $SearchRequestCopyWith(
          SearchRequest value, $Res Function(SearchRequest) _then) =
      _$SearchRequestCopyWithImpl;
  @useResult
  $Res call({String? query, int? page, int? nextPage, int? hitsPerPage});
}

/// @nodoc
class _$SearchRequestCopyWithImpl<$Res>
    implements $SearchRequestCopyWith<$Res> {
  _$SearchRequestCopyWithImpl(this._self, this._then);

  final SearchRequest _self;
  final $Res Function(SearchRequest) _then;

  /// Create a copy of SearchRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = freezed,
    Object? page = freezed,
    Object? nextPage = freezed,
    Object? hitsPerPage = freezed,
  }) {
    return _then(_self.copyWith(
      query: freezed == query
          ? _self.query
          : query // ignore: cast_nullable_to_non_nullable
              as String?,
      page: freezed == page
          ? _self.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      nextPage: freezed == nextPage
          ? _self.nextPage
          : nextPage // ignore: cast_nullable_to_non_nullable
              as int?,
      hitsPerPage: freezed == hitsPerPage
          ? _self.hitsPerPage
          : hitsPerPage // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _SearchRequest implements SearchRequest {
  const _SearchRequest(
      {this.query, this.page, this.nextPage, this.hitsPerPage});

  @override
  final String? query;
  @override
  final int? page;
  @override
  final int? nextPage;
  @override
  final int? hitsPerPage;

  /// Create a copy of SearchRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SearchRequestCopyWith<_SearchRequest> get copyWith =>
      __$SearchRequestCopyWithImpl<_SearchRequest>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SearchRequest &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.nextPage, nextPage) ||
                other.nextPage == nextPage) &&
            (identical(other.hitsPerPage, hitsPerPage) ||
                other.hitsPerPage == hitsPerPage));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, query, page, nextPage, hitsPerPage);

  @override
  String toString() {
    return 'SearchRequest(query: $query, page: $page, nextPage: $nextPage, hitsPerPage: $hitsPerPage)';
  }
}

/// @nodoc
abstract mixin class _$SearchRequestCopyWith<$Res>
    implements $SearchRequestCopyWith<$Res> {
  factory _$SearchRequestCopyWith(
          _SearchRequest value, $Res Function(_SearchRequest) _then) =
      __$SearchRequestCopyWithImpl;
  @override
  @useResult
  $Res call({String? query, int? page, int? nextPage, int? hitsPerPage});
}

/// @nodoc
class __$SearchRequestCopyWithImpl<$Res>
    implements _$SearchRequestCopyWith<$Res> {
  __$SearchRequestCopyWithImpl(this._self, this._then);

  final _SearchRequest _self;
  final $Res Function(_SearchRequest) _then;

  /// Create a copy of SearchRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? query = freezed,
    Object? page = freezed,
    Object? nextPage = freezed,
    Object? hitsPerPage = freezed,
  }) {
    return _then(_SearchRequest(
      query: freezed == query
          ? _self.query
          : query // ignore: cast_nullable_to_non_nullable
              as String?,
      page: freezed == page
          ? _self.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      nextPage: freezed == nextPage
          ? _self.nextPage
          : nextPage // ignore: cast_nullable_to_non_nullable
              as int?,
      hitsPerPage: freezed == hitsPerPage
          ? _self.hitsPerPage
          : hitsPerPage // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

// dart format on
