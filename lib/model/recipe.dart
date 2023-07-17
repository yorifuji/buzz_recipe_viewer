import 'package:buzz_recipe_viewer/model/search_hit.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe.freezed.dart';

@freezed
class Recipe with _$Recipe {
  const factory Recipe({
    required SearchHit searchHit,
    @Default(false) bool isFavorite,
  }) = _Recipe;
}
