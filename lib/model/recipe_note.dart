import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe_note.freezed.dart';

@freezed
class RecipeNote with _$RecipeNote {
  const factory RecipeNote({
    required String title,
    required String description,
    required List<String> foodList,
    required List<String> stepList,
    required DateTime createdAt,
    required DateTime updatedAt,
    int? id,
  }) = _RecipeNote;
}
