// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_recipe_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GetRecipeResult {
  List<SearchHit> get searchHits => throw _privateConstructorUsedError;
  int get nextPage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GetRecipeResultCopyWith<GetRecipeResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetRecipeResultCopyWith<$Res> {
  factory $GetRecipeResultCopyWith(
          GetRecipeResult value, $Res Function(GetRecipeResult) then) =
      _$GetRecipeResultCopyWithImpl<$Res, GetRecipeResult>;
  @useResult
  $Res call({List<SearchHit> searchHits, int nextPage});
}

/// @nodoc
class _$GetRecipeResultCopyWithImpl<$Res, $Val extends GetRecipeResult>
    implements $GetRecipeResultCopyWith<$Res> {
  _$GetRecipeResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
abstract class _$$GetRecipeResultImplCopyWith<$Res>
    implements $GetRecipeResultCopyWith<$Res> {
  factory _$$GetRecipeResultImplCopyWith(_$GetRecipeResultImpl value,
          $Res Function(_$GetRecipeResultImpl) then) =
      __$$GetRecipeResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<SearchHit> searchHits, int nextPage});
}

/// @nodoc
class __$$GetRecipeResultImplCopyWithImpl<$Res>
    extends _$GetRecipeResultCopyWithImpl<$Res, _$GetRecipeResultImpl>
    implements _$$GetRecipeResultImplCopyWith<$Res> {
  __$$GetRecipeResultImplCopyWithImpl(
      _$GetRecipeResultImpl _value, $Res Function(_$GetRecipeResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchHits = null,
    Object? nextPage = null,
  }) {
    return _then(_$GetRecipeResultImpl(
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

class _$GetRecipeResultImpl implements _GetRecipeResult {
  const _$GetRecipeResultImpl(
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
    return 'GetRecipeResult(searchHits: $searchHits, nextPage: $nextPage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetRecipeResultImpl &&
            const DeepCollectionEquality()
                .equals(other._searchHits, _searchHits) &&
            (identical(other.nextPage, nextPage) ||
                other.nextPage == nextPage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_searchHits), nextPage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetRecipeResultImplCopyWith<_$GetRecipeResultImpl> get copyWith =>
      __$$GetRecipeResultImplCopyWithImpl<_$GetRecipeResultImpl>(
          this, _$identity);
}

abstract class _GetRecipeResult implements GetRecipeResult {
  const factory _GetRecipeResult(
      {final List<SearchHit> searchHits,
      final int nextPage}) = _$GetRecipeResultImpl;

  @override
  List<SearchHit> get searchHits;
  @override
  int get nextPage;
  @override
  @JsonKey(ignore: true)
  _$$GetRecipeResultImplCopyWith<_$GetRecipeResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
