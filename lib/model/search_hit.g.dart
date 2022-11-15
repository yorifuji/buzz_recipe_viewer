// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'search_hit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SearchHit _$$_SearchHitFromJson(Map<String, dynamic> json) => _$_SearchHit(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      published: json['published'] as String,
      timestamp: json['timestamp'] as int,
      views: json['views'] as int,
      likes: json['likes'] as int,
      image: json['image'] as String,
      url: json['url'] as String,
      objectID: json['objectID'] as String,
    );

Map<String, dynamic> _$$_SearchHitToJson(_$_SearchHit instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'published': instance.published,
      'timestamp': instance.timestamp,
      'views': instance.views,
      'likes': instance.likes,
      'image': instance.image,
      'url': instance.url,
      'objectID': instance.objectID,
    };
