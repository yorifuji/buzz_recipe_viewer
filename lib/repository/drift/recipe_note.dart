import 'package:buzz_recipe_viewer/model/recipe_note.dart';
import 'package:buzz_recipe_viewer/repository/drift/database.dart';
import 'package:drift/drift.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe_note.g.dart';

class RecipeNoteDB extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get createdAt =>
      dateTime().withDefault(Constant(DateTime.now()))();
  DateTimeColumn get updatedAt =>
      dateTime().withDefault(Constant(DateTime.now()))();
  TextColumn get data => text().map(RecipeNoteData.converter)();
}

@JsonSerializable()
class RecipeNoteData {
  RecipeNoteData(
    this.title,
    this.description,
    this.foodList,
    this.stepList,
    this.createdAt,
    this.updatedAt,
  );
  factory RecipeNoteData.from(RecipeNote recipeNote) {
    return RecipeNoteData(
      recipeNote.title,
      recipeNote.description,
      recipeNote.foodList,
      recipeNote.stepList,
      recipeNote.createdAt,
      recipeNote.updatedAt,
    );
  }
  factory RecipeNoteData.fromJson(Map<String, Object?> json) =>
      _$RecipeNoteDataFromJson(json);

  String title;
  String description;
  List<String> foodList;
  List<String> stepList;
  DateTime createdAt;
  DateTime updatedAt;

  Map<String, Object?> toJson() => _$RecipeNoteDataToJson(this);

  static TypeConverter<RecipeNoteData, String> converter = TypeConverter.json(
    fromJson: (json) => RecipeNoteData.fromJson(json as Map<String, Object?>),
    toJson: (pref) => pref.toJson(),
  );
}

extension RecipeNoteDBDataExt on RecipeNoteDBData {
  RecipeNote toRecipeNote() {
    return RecipeNote(
      id: id,
      title: data.title,
      description: data.description,
      foodList: data.foodList,
      stepList: data.stepList,
      createdAt: data.createdAt,
      updatedAt: data.updatedAt,
    );
  }
}
