// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'recipe_note.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecipeNoteData _$RecipeNoteDataFromJson(Map<String, dynamic> json) =>
    RecipeNoteData(
      json['title'] as String,
      json['description'] as String,
      (json['foodList'] as List<dynamic>).map((e) => e as String).toList(),
      (json['stepList'] as List<dynamic>).map((e) => e as String).toList(),
      DateTime.parse(json['createdAt'] as String),
      DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$RecipeNoteDataToJson(RecipeNoteData instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'foodList': instance.foodList,
      'stepList': instance.stepList,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
