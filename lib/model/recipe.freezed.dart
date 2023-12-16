// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipe.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Recipe {
  SearchHit get searchHit => throw _privateConstructorUsedError;
  Favorite? get favorite => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RecipeCopyWith<Recipe> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecipeCopyWith<$Res> {
  factory $RecipeCopyWith(Recipe value, $Res Function(Recipe) then) =
      _$RecipeCopyWithImpl<$Res, Recipe>;
  @useResult
  $Res call({SearchHit searchHit, Favorite? favorite});

  $SearchHitCopyWith<$Res> get searchHit;
}

/// @nodoc
class _$RecipeCopyWithImpl<$Res, $Val extends Recipe>
    implements $RecipeCopyWith<$Res> {
  _$RecipeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchHit = null,
    Object? favorite = freezed,
  }) {
    return _then(_value.copyWith(
      searchHit: null == searchHit
          ? _value.searchHit
          : searchHit // ignore: cast_nullable_to_non_nullable
              as SearchHit,
      favorite: freezed == favorite
          ? _value.favorite
          : favorite // ignore: cast_nullable_to_non_nullable
              as Favorite?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SearchHitCopyWith<$Res> get searchHit {
    return $SearchHitCopyWith<$Res>(_value.searchHit, (value) {
      return _then(_value.copyWith(searchHit: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RecipeImplCopyWith<$Res> implements $RecipeCopyWith<$Res> {
  factory _$$RecipeImplCopyWith(
          _$RecipeImpl value, $Res Function(_$RecipeImpl) then) =
      __$$RecipeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({SearchHit searchHit, Favorite? favorite});

  @override
  $SearchHitCopyWith<$Res> get searchHit;
}

/// @nodoc
class __$$RecipeImplCopyWithImpl<$Res>
    extends _$RecipeCopyWithImpl<$Res, _$RecipeImpl>
    implements _$$RecipeImplCopyWith<$Res> {
  __$$RecipeImplCopyWithImpl(
      _$RecipeImpl _value, $Res Function(_$RecipeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchHit = null,
    Object? favorite = freezed,
  }) {
    return _then(_$RecipeImpl(
      searchHit: null == searchHit
          ? _value.searchHit
          : searchHit // ignore: cast_nullable_to_non_nullable
              as SearchHit,
      favorite: freezed == favorite
          ? _value.favorite
          : favorite // ignore: cast_nullable_to_non_nullable
              as Favorite?,
    ));
  }
}

/// @nodoc

class _$RecipeImpl implements _Recipe {
  const _$RecipeImpl({required this.searchHit, this.favorite = null});

  @override
  final SearchHit searchHit;
  @override
  @JsonKey()
  final Favorite? favorite;

  @override
  String toString() {
    return 'Recipe(searchHit: $searchHit, favorite: $favorite)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecipeImpl &&
            (identical(other.searchHit, searchHit) ||
                other.searchHit == searchHit) &&
            (identical(other.favorite, favorite) ||
                other.favorite == favorite));
  }

  @override
  int get hashCode => Object.hash(runtimeType, searchHit, favorite);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RecipeImplCopyWith<_$RecipeImpl> get copyWith =>
      __$$RecipeImplCopyWithImpl<_$RecipeImpl>(this, _$identity);
}

abstract class _Recipe implements Recipe {
  const factory _Recipe(
      {required final SearchHit searchHit,
      final Favorite? favorite}) = _$RecipeImpl;

  @override
  SearchHit get searchHit;
  @override
  Favorite? get favorite;
  @override
  @JsonKey(ignore: true)
  _$$RecipeImplCopyWith<_$RecipeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
