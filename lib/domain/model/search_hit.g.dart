// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'search_hit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SearchHitImpl _$$SearchHitImplFromJson(Map<String, dynamic> json) =>
    _$SearchHitImpl(
      id: json['id'] as String,
      videoId: json['videoId'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      published: json['published'] as String,
      timestamp: (json['timestamp'] as num).toInt(),
      views: (json['views'] as num).toInt(),
      likes: (json['likes'] as num).toInt(),
      image: json['image'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$$SearchHitImplToJson(_$SearchHitImpl instance) =>
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
