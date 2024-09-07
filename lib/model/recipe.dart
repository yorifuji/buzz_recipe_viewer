import 'package:buzz_recipe_viewer/model/timestamp_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe.freezed.dart';
part 'recipe.g.dart';

@freezed
class Recipe with _$Recipe {
  const factory Recipe({
    required String title,
    required String description,
    required List<String> foodList,
    required List<String> stepList,
    @CreatedAtField() required DateTime createdAt,
    @UpdatedAtField() required DateTime updatedAt,
    String? id,
  }) = _Recipe;

  factory Recipe.fromJson(Map<String, Object?> json) => _$RecipeFromJson(json);
}
