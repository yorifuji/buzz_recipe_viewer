// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'favorite.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavoriteData _$FavoriteDataFromJson(Map<String, dynamic> json) => FavoriteData(
      FavoriteVideoData.fromJson(
          json['favoriteVideoData'] as Map<String, dynamic>),
      DateTime.parse(json['createdAt'] as String),
      DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$FavoriteDataToJson(FavoriteData instance) =>
    <String, dynamic>{
      'favoriteVideoData': instance.favoriteVideoData,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

FavoriteVideoData _$FavoriteVideoDataFromJson(Map<String, dynamic> json) =>
    FavoriteVideoData(
      json['id'] as String,
      json['videoId'] as String,
      json['title'] as String,
      json['description'] as String,
      json['published'] as String,
      (json['timestamp'] as num).toInt(),
      (json['views'] as num).toInt(),
      (json['likes'] as num).toInt(),
      json['image'] as String,
      json['url'] as String,
    );

Map<String, dynamic> _$FavoriteVideoDataToJson(FavoriteVideoData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'videoId': instance.videoId,
      'title': instance.title,
      'description': instance.description,
      'published': instance.published,
      'timestamp': instance.timestamp,
      'views': instance.views,
      'likes': instance.likes,
      'image': instance.image,
      'url': instance.url,
    };
