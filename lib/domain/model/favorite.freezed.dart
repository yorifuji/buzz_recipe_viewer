// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favorite.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Favorite {
  SearchHit get searchHit;
  @CreatedAtField()
  DateTime get createdAt;
  @UpdatedAtField()
  DateTime get updatedAt;
  String? get id;

  /// Create a copy of Favorite
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FavoriteCopyWith<Favorite> get copyWith =>
      _$FavoriteCopyWithImpl<Favorite>(this as Favorite, _$identity);

  /// Serializes this Favorite to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Favorite &&
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

  @override
  String toString() {
    return 'Favorite(searchHit: $searchHit, createdAt: $createdAt, updatedAt: $updatedAt, id: $id)';
  }
}

/// @nodoc
abstract mixin class $FavoriteCopyWith<$Res> {
  factory $FavoriteCopyWith(Favorite value, $Res Function(Favorite) _then) =
      _$FavoriteCopyWithImpl;
  @useResult
  $Res call(
      {SearchHit searchHit,
      @CreatedAtField() DateTime createdAt,
      @UpdatedAtField() DateTime updatedAt,
      String? id});

  $SearchHitCopyWith<$Res> get searchHit;
}

/// @nodoc
class _$FavoriteCopyWithImpl<$Res> implements $FavoriteCopyWith<$Res> {
  _$FavoriteCopyWithImpl(this._self, this._then);

  final Favorite _self;
  final $Res Function(Favorite) _then;

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
    return _then(_self.copyWith(
      searchHit: null == searchHit
          ? _self.searchHit
          : searchHit // ignore: cast_nullable_to_non_nullable
              as SearchHit,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of Favorite
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SearchHitCopyWith<$Res> get searchHit {
    return $SearchHitCopyWith<$Res>(_self.searchHit, (value) {
      return _then(_self.copyWith(searchHit: value));
    });
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _Favorite extends Favorite {
  const _Favorite(
      {required this.searchHit,
      @CreatedAtField() required this.createdAt,
      @UpdatedAtField() required this.updatedAt,
      this.id})
      : super._();
  factory _Favorite.fromJson(Map<String, dynamic> json) =>
      _$FavoriteFromJson(json);

  @override
  final SearchHit searchHit;
  @override
  @CreatedAtField()
  final DateTime createdAt;
  @override
  @UpdatedAtField()
  final DateTime updatedAt;
  @override
  final String? id;

  /// Create a copy of Favorite
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FavoriteCopyWith<_Favorite> get copyWith =>
      __$FavoriteCopyWithImpl<_Favorite>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$FavoriteToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Favorite &&
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

  @override
  String toString() {
    return 'Favorite(searchHit: $searchHit, createdAt: $createdAt, updatedAt: $updatedAt, id: $id)';
  }
}

/// @nodoc
abstract mixin class _$FavoriteCopyWith<$Res>
    implements $FavoriteCopyWith<$Res> {
  factory _$FavoriteCopyWith(_Favorite value, $Res Function(_Favorite) _then) =
      __$FavoriteCopyWithImpl;
  @override
  @useResult
  $Res call(
      {SearchHit searchHit,
      @CreatedAtField() DateTime createdAt,
      @UpdatedAtField() DateTime updatedAt,
      String? id});

  @override
  $SearchHitCopyWith<$Res> get searchHit;
}

/// @nodoc
class __$FavoriteCopyWithImpl<$Res> implements _$FavoriteCopyWith<$Res> {
  __$FavoriteCopyWithImpl(this._self, this._then);

  final _Favorite _self;
  final $Res Function(_Favorite) _then;

  /// Create a copy of Favorite
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? searchHit = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? id = freezed,
  }) {
    return _then(_Favorite(
      searchHit: null == searchHit
          ? _self.searchHit
          : searchHit // ignore: cast_nullable_to_non_nullable
              as SearchHit,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of Favorite
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SearchHitCopyWith<$Res> get searchHit {
    return $SearchHitCopyWith<$Res>(_self.searchHit, (value) {
      return _then(_self.copyWith(searchHit: value));
    });
  }
}

// dart format on
