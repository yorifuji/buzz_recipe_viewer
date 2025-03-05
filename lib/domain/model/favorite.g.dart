// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'favorite.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Favorite _$FavoriteFromJson(Map<String, dynamic> json) => _Favorite(
      searchHit: SearchHit.fromJson(json['searchHit'] as Map<String, dynamic>),
      createdAt: const CreatedAtField().fromJson(json['createdAt']),
      updatedAt: const UpdatedAtField().fromJson(json['updatedAt']),
      id: json['id'] as String?,
    );

Map<String, dynamic> _$FavoriteToJson(_Favorite instance) => <String, dynamic>{
      'searchHit': instance.searchHit.toJson(),
      'createdAt': const CreatedAtField().toJson(instance.createdAt),
      'updatedAt': const UpdatedAtField().toJson(instance.updatedAt),
      'id': instance.id,
    };
