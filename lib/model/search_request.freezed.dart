// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SearchRequest {
  String? get query => throw _privateConstructorUsedError;
  int? get page => throw _privateConstructorUsedError;
  int? get nextPage => throw _privateConstructorUsedError;
  int? get hitsPerPage => throw _privateConstructorUsedError;

  /// Create a copy of SearchRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SearchRequestCopyWith<SearchRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchRequestCopyWith<$Res> {
  factory $SearchRequestCopyWith(
          SearchRequest value, $Res Function(SearchRequest) then) =
      _$SearchRequestCopyWithImpl<$Res, SearchRequest>;
  @useResult
  $Res call({String? query, int? page, int? nextPage, int? hitsPerPage});
}

/// @nodoc
class _$SearchRequestCopyWithImpl<$Res, $Val extends SearchRequest>
    implements $SearchRequestCopyWith<$Res> {
  _$SearchRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      query: freezed == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String?,
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      nextPage: freezed == nextPage
          ? _value.nextPage
          : nextPage // ignore: cast_nullable_to_non_nullable
              as int?,
      hitsPerPage: freezed == hitsPerPage
          ? _value.hitsPerPage
          : hitsPerPage // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchRequestImplCopyWith<$Res>
    implements $SearchRequestCopyWith<$Res> {
  factory _$$SearchRequestImplCopyWith(
          _$SearchRequestImpl value, $Res Function(_$SearchRequestImpl) then) =
      __$$SearchRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? query, int? page, int? nextPage, int? hitsPerPage});
}

/// @nodoc
class __$$SearchRequestImplCopyWithImpl<$Res>
    extends _$SearchRequestCopyWithImpl<$Res, _$SearchRequestImpl>
    implements _$$SearchRequestImplCopyWith<$Res> {
  __$$SearchRequestImplCopyWithImpl(
      _$SearchRequestImpl _value, $Res Function(_$SearchRequestImpl) _then)
      : super(_value, _then);

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
    return _then(_$SearchRequestImpl(
      query: freezed == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String?,
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      nextPage: freezed == nextPage
          ? _value.nextPage
          : nextPage // ignore: cast_nullable_to_non_nullable
              as int?,
      hitsPerPage: freezed == hitsPerPage
          ? _value.hitsPerPage
          : hitsPerPage // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$SearchRequestImpl implements _SearchRequest {
  const _$SearchRequestImpl(
      {this.query, this.page, this.nextPage, this.hitsPerPage});

  @override
  final String? query;
  @override
  final int? page;
  @override
  final int? nextPage;
  @override
  final int? hitsPerPage;

  @override
  String toString() {
    return 'SearchRequest(query: $query, page: $page, nextPage: $nextPage, hitsPerPage: $hitsPerPage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchRequestImpl &&
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

  /// Create a copy of SearchRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchRequestImplCopyWith<_$SearchRequestImpl> get copyWith =>
      __$$SearchRequestImplCopyWithImpl<_$SearchRequestImpl>(this, _$identity);
}

abstract class _SearchRequest implements SearchRequest {
  const factory _SearchRequest(
      {final String? query,
      final int? page,
      final int? nextPage,
      final int? hitsPerPage}) = _$SearchRequestImpl;

  @override
  String? get query;
  @override
  int? get page;
  @override
  int? get nextPage;
  @override
  int? get hitsPerPage;

  /// Create a copy of SearchRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchRequestImplCopyWith<_$SearchRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
