import 'package:isar/isar.dart';

part 'recipe_note.g.dart';

@collection
class RecipeNote {
  RecipeNote(this.title, this.description, this.foodList, this.stepList)
      : createdAt = DateTime.now(),
        updatedAt = DateTime.now();

  Id id = Isar.autoIncrement;
  String title;
  String description;
  List<String> foodList;
  List<String> stepList;
  DateTime createdAt;
  DateTime updatedAt;
}
