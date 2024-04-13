import 'package:buzz_recipe_viewer/repository/drift/connection/connection.dart'
    as impl;
import 'package:buzz_recipe_viewer/repository/drift/favorite.dart';
import 'package:buzz_recipe_viewer/repository/drift/recipe_note.dart';
import 'package:drift/drift.dart';

part 'database.g.dart';

@DriftDatabase(tables: [RecipeNoteDB, FavoriteDB])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(impl.connect());

  @override
  int get schemaVersion => 1;

  void clearAll() {
    delete(recipeNoteDB).go();
    delete(favoriteDB).go();
  }
}
