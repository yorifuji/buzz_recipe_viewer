import 'package:buzz_recipe_viewer/domain/model/storage_image.dart';
import 'package:buzz_recipe_viewer/domain/model/timestamp_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe.freezed.dart';
part 'recipe.g.dart';

extension type RecipeId(String value) {
  RecipeId.fromJson(String value) : this(value);
  String toJson() => value;
}

@freezed
abstract class Recipe with _$Recipe {
  @JsonSerializable(explicitToJson: true)
  const factory Recipe({
    required String title,
    required String description,
    required List<String> foodList,
    required List<String> stepList,
    @CreatedAtField() required DateTime createdAt,
    @UpdatedAtField() required DateTime updatedAt,
    required List<StorageImage> imageList,
    required RecipeId recipeId,
  }) = _Recipe;

  factory Recipe.fromJson(Map<String, Object?> json) => _$RecipeFromJson(json);
}
