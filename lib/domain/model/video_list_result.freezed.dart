// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'video_list_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VideoListResult {
  List<SearchHit> get searchHits;
  int get nextPage;

  /// Create a copy of VideoListResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $VideoListResultCopyWith<VideoListResult> get copyWith =>
      _$VideoListResultCopyWithImpl<VideoListResult>(
          this as VideoListResult, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is VideoListResult &&
            const DeepCollectionEquality()
                .equals(other.searchHits, searchHits) &&
            (identical(other.nextPage, nextPage) ||
                other.nextPage == nextPage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(searchHits), nextPage);

  @override
  String toString() {
    return 'VideoListResult(searchHits: $searchHits, nextPage: $nextPage)';
  }
}

/// @nodoc
abstract mixin class $VideoListResultCopyWith<$Res> {
  factory $VideoListResultCopyWith(
          VideoListResult value, $Res Function(VideoListResult) _then) =
      _$VideoListResultCopyWithImpl;
  @useResult
  $Res call({List<SearchHit> searchHits, int nextPage});
}

/// @nodoc
class _$VideoListResultCopyWithImpl<$Res>
    implements $VideoListResultCopyWith<$Res> {
  _$VideoListResultCopyWithImpl(this._self, this._then);

  final VideoListResult _self;
  final $Res Function(VideoListResult) _then;

  /// Create a copy of VideoListResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchHits = null,
    Object? nextPage = null,
  }) {
    return _then(_self.copyWith(
      searchHits: null == searchHits
          ? _self.searchHits
          : searchHits // ignore: cast_nullable_to_non_nullable
              as List<SearchHit>,
      nextPage: null == nextPage
          ? _self.nextPage
          : nextPage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _VideoListResult implements VideoListResult {
  const _VideoListResult(
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

  /// Create a copy of VideoListResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$VideoListResultCopyWith<_VideoListResult> get copyWith =>
      __$VideoListResultCopyWithImpl<_VideoListResult>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _VideoListResult &&
            const DeepCollectionEquality()
                .equals(other._searchHits, _searchHits) &&
            (identical(other.nextPage, nextPage) ||
                other.nextPage == nextPage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_searchHits), nextPage);

  @override
  String toString() {
    return 'VideoListResult(searchHits: $searchHits, nextPage: $nextPage)';
  }
}

/// @nodoc
abstract mixin class _$VideoListResultCopyWith<$Res>
    implements $VideoListResultCopyWith<$Res> {
  factory _$VideoListResultCopyWith(
          _VideoListResult value, $Res Function(_VideoListResult) _then) =
      __$VideoListResultCopyWithImpl;
  @override
  @useResult
  $Res call({List<SearchHit> searchHits, int nextPage});
}

/// @nodoc
class __$VideoListResultCopyWithImpl<$Res>
    implements _$VideoListResultCopyWith<$Res> {
  __$VideoListResultCopyWithImpl(this._self, this._then);

  final _VideoListResult _self;
  final $Res Function(_VideoListResult) _then;

  /// Create a copy of VideoListResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? searchHits = null,
    Object? nextPage = null,
  }) {
    return _then(_VideoListResult(
      searchHits: null == searchHits
          ? _self._searchHits
          : searchHits // ignore: cast_nullable_to_non_nullable
              as List<SearchHit>,
      nextPage: null == nextPage
          ? _self.nextPage
          : nextPage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
