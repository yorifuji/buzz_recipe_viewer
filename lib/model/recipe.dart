import 'package:buzz_recipe_viewer/model/storage_image.dart';
import 'package:buzz_recipe_viewer/model/timestamp_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe.freezed.dart';
part 'recipe.g.dart';

extension type RecipeId(String _) {}

@freezed
class Recipe with _$Recipe {
  @JsonSerializable(explicitToJson: true)
  const factory Recipe({
    required String title,
    required String description,
    required List<String> foodList,
    required List<String> stepList,
    @CreatedAtField() required DateTime createdAt,
    @UpdatedAtField() required DateTime updatedAt,
    required List<StorageImage> imageList,
    @RecipeIdConverter() RecipeId? recipeId,
  }) = _Recipe;

  factory Recipe.fromJson(Map<String, Object?> json) => _$RecipeFromJson(json);
}

class RecipeIdConverter implements JsonConverter<RecipeId?, dynamic> {
  const RecipeIdConverter();

  @override
  RecipeId? fromJson(dynamic value) {
    if (value == null) {
      return null;
    }
    return RecipeId(value as String);
  }

  @override
  dynamic toJson(RecipeId? documentId) => documentId;
}
