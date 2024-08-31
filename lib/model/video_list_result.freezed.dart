// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'video_list_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$VideoListResult {
  List<SearchHit> get searchHits => throw _privateConstructorUsedError;
  int get nextPage => throw _privateConstructorUsedError;

  /// Create a copy of VideoListResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VideoListResultCopyWith<VideoListResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VideoListResultCopyWith<$Res> {
  factory $VideoListResultCopyWith(
          VideoListResult value, $Res Function(VideoListResult) then) =
      _$VideoListResultCopyWithImpl<$Res, VideoListResult>;
  @useResult
  $Res call({List<SearchHit> searchHits, int nextPage});
}

/// @nodoc
class _$VideoListResultCopyWithImpl<$Res, $Val extends VideoListResult>
    implements $VideoListResultCopyWith<$Res> {
  _$VideoListResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VideoListResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchHits = null,
    Object? nextPage = null,
  }) {
    return _then(_value.copyWith(
      searchHits: null == searchHits
          ? _value.searchHits
          : searchHits // ignore: cast_nullable_to_non_nullable
              as List<SearchHit>,
      nextPage: null == nextPage
          ? _value.nextPage
          : nextPage // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VideoListResultImplCopyWith<$Res>
    implements $VideoListResultCopyWith<$Res> {
  factory _$$VideoListResultImplCopyWith(_$VideoListResultImpl value,
          $Res Function(_$VideoListResultImpl) then) =
      __$$VideoListResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<SearchHit> searchHits, int nextPage});
}

/// @nodoc
class __$$VideoListResultImplCopyWithImpl<$Res>
    extends _$VideoListResultCopyWithImpl<$Res, _$VideoListResultImpl>
    implements _$$VideoListResultImplCopyWith<$Res> {
  __$$VideoListResultImplCopyWithImpl(
      _$VideoListResultImpl _value, $Res Function(_$VideoListResultImpl) _then)
      : super(_value, _then);

  /// Create a copy of VideoListResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchHits = null,
    Object? nextPage = null,
  }) {
    return _then(_$VideoListResultImpl(
      searchHits: null == searchHits
          ? _value._searchHits
          : searchHits // ignore: cast_nullable_to_non_nullable
              as List<SearchHit>,
      nextPage: null == nextPage
          ? _value.nextPage
          : nextPage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$VideoListResultImpl implements _VideoListResult {
  const _$VideoListResultImpl(
      {final List<SearchHit> searchHits = const <SearchHit>[],
      this.nextPage = 0})
      : _searchHits = searchHits;

  final List<SearchHit> _searchHits;
  @override
  @JsonKey()
  List<SearchHit> get searchHits {
    if (_searchHits is EqualUnmodifiableListView) return _searchHits;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_searchHits);
  }

  @override
  @JsonKey()
  final int nextPage;

  @override
  String toString() {
    return 'VideoListResult(searchHits: $searchHits, nextPage: $nextPage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VideoListResultImpl &&
            const DeepCollectionEquality()
                .equals(other._searchHits, _searchHits) &&
            (identical(other.nextPage, nextPage) ||
                other.nextPage == nextPage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_searchHits), nextPage);

  /// Create a copy of VideoListResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VideoListResultImplCopyWith<_$VideoListResultImpl> get copyWith =>
      __$$VideoListResultImplCopyWithImpl<_$VideoListResultImpl>(
          this, _$identity);
}

abstract class _VideoListResult implements VideoListResult {
  const factory _VideoListResult(
      {final List<SearchHit> searchHits,
      final int nextPage}) = _$VideoListResultImpl;

  @override
  List<SearchHit> get searchHits;
  @override
  int get nextPage;

  /// Create a copy of VideoListResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VideoListResultImplCopyWith<_$VideoListResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
