// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favorite.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Favorite _$FavoriteFromJson(Map<String, dynamic> json) {
  return _Favorite.fromJson(json);
}

/// @nodoc
mixin _$Favorite {
  @SearchHitField()
  SearchHit get searchHit => throw _privateConstructorUsedError;
  @CreatedAtField()
  DateTime get createdAt => throw _privateConstructorUsedError;
  @UpdatedAtField()
  DateTime get updatedAt => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;

  /// Serializes this Favorite to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Favorite
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FavoriteCopyWith<Favorite> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoriteCopyWith<$Res> {
  factory $FavoriteCopyWith(Favorite value, $Res Function(Favorite) then) =
      _$FavoriteCopyWithImpl<$Res, Favorite>;
  @useResult
  $Res call(
      {@SearchHitField() SearchHit searchHit,
      @CreatedAtField() DateTime createdAt,
      @UpdatedAtField() DateTime updatedAt,
      String? id});

  $SearchHitCopyWith<$Res> get searchHit;
}

/// @nodoc
class _$FavoriteCopyWithImpl<$Res, $Val extends Favorite>
    implements $FavoriteCopyWith<$Res> {
  _$FavoriteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Favorite
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchHit = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      searchHit: null == searchHit
          ? _value.searchHit
          : searchHit // ignore: cast_nullable_to_non_nullable
              as SearchHit,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of Favorite
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SearchHitCopyWith<$Res> get searchHit {
    return $SearchHitCopyWith<$Res>(_value.searchHit, (value) {
      return _then(_value.copyWith(searchHit: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FavoriteImplCopyWith<$Res>
    implements $FavoriteCopyWith<$Res> {
  factory _$$FavoriteImplCopyWith(
          _$FavoriteImpl value, $Res Function(_$FavoriteImpl) then) =
      __$$FavoriteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@SearchHitField() SearchHit searchHit,
      @CreatedAtField() DateTime createdAt,
      @UpdatedAtField() DateTime updatedAt,
      String? id});

  @override
  $SearchHitCopyWith<$Res> get searchHit;
}

/// @nodoc
class __$$FavoriteImplCopyWithImpl<$Res>
    extends _$FavoriteCopyWithImpl<$Res, _$FavoriteImpl>
    implements _$$FavoriteImplCopyWith<$Res> {
  __$$FavoriteImplCopyWithImpl(
      _$FavoriteImpl _value, $Res Function(_$FavoriteImpl) _then)
      : super(_value, _then);

  /// Create a copy of Favorite
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchHit = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? id = freezed,
  }) {
    return _then(_$FavoriteImpl(
      searchHit: null == searchHit
          ? _value.searchHit
          : searchHit // ignore: cast_nullable_to_non_nullable
              as SearchHit,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FavoriteImpl extends _Favorite {
  const _$FavoriteImpl(
      {@SearchHitField() required this.searchHit,
      @CreatedAtField() required this.createdAt,
      @UpdatedAtField() required this.updatedAt,
      this.id})
      : super._();

  factory _$FavoriteImpl.fromJson(Map<String, dynamic> json) =>
      _$$FavoriteImplFromJson(json);

  @override
  @SearchHitField()
  final SearchHit searchHit;
  @override
  @CreatedAtField()
  final DateTime createdAt;
  @override
  @UpdatedAtField()
  final DateTime updatedAt;
  @override
  final String? id;

  @override
  String toString() {
    return 'Favorite(searchHit: $searchHit, createdAt: $createdAt, updatedAt: $updatedAt, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FavoriteImpl &&
            (identical(other.searchHit, searchHit) ||
                other.searchHit == searchHit) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, searchHit, createdAt, updatedAt, id);

  /// Create a copy of Favorite
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FavoriteImplCopyWith<_$FavoriteImpl> get copyWith =>
      __$$FavoriteImplCopyWithImpl<_$FavoriteImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FavoriteImplToJson(
      this,
    );
  }
}

abstract class _Favorite extends Favorite {
  const factory _Favorite(
      {@SearchHitField() required final SearchHit searchHit,
      @CreatedAtField() required final DateTime createdAt,
      @UpdatedAtField() required final DateTime updatedAt,
      final String? id}) = _$FavoriteImpl;
  const _Favorite._() : super._();

  factory _Favorite.fromJson(Map<String, dynamic> json) =
      _$FavoriteImpl.fromJson;

  @override
  @SearchHitField()
  SearchHit get searchHit;
  @override
  @CreatedAtField()
  DateTime get createdAt;
  @override
  @UpdatedAtField()
  DateTime get updatedAt;
  @override
  String? get id;

  /// Create a copy of Favorite
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FavoriteImplCopyWith<_$FavoriteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
