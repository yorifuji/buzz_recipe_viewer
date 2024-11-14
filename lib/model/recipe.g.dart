// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'recipe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RecipeImpl _$$RecipeImplFromJson(Map<String, dynamic> json) => _$RecipeImpl(
      title: json['title'] as String,
      description: json['description'] as String,
      foodList:
          (json['foodList'] as List<dynamic>).map((e) => e as String).toList(),
      stepList:
          (json['stepList'] as List<dynamic>).map((e) => e as String).toList(),
      createdAt: const CreatedAtField().fromJson(json['createdAt']),
      updatedAt: const UpdatedAtField().fromJson(json['updatedAt']),
      imageList: (json['imageList'] as List<dynamic>)
          .map((e) => StorageImage.fromJson(e as Map<String, dynamic>))
          .toList(),
      recipeId: RecipeId.fromJson(json['recipeId'] as String),
    );

Map<String, dynamic> _$$RecipeImplToJson(_$RecipeImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'foodList': instance.foodList,
      'stepList': instance.stepList,
      'createdAt': const CreatedAtField().toJson(instance.createdAt),
      'updatedAt': const UpdatedAtField().toJson(instance.updatedAt),
      'imageList': instance.imageList.map((e) => e.toJson()).toList(),
      'recipeId': instance.recipeId.toJson(),
    };
