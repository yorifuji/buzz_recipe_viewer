import 'package:buzz_recipe_viewer/model/recipe_note.dart';
import 'package:buzz_recipe_viewer/provider/database_provider.dart';
import 'package:buzz_recipe_viewer/repository/drift/database.dart';
import 'package:buzz_recipe_viewer/repository/drift/recipe_note.dart';
import 'package:drift/drift.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'recipe_note_repository.g.dart';

@riverpod
RecipeNoteRepository recipeNoteRepository(RecipeNoteRepositoryRef ref) =>
    RecipeNoteRepository(ref.watch(databaseProvider));

class RecipeNoteRepository {
  RecipeNoteRepository(this.database);
  AppDatabase database;

  Future<void> create(RecipeNote recipeNote) async {
    await database.into(database.recipeNoteDB).insert(
          RecipeNoteDBCompanion.insert(
            data: RecipeNoteData.from(recipeNote),
            createdAt: Value(recipeNote.createdAt),
            updatedAt: Value(recipeNote.updatedAt),
          ),
        );
  }

  Future<void> update(RecipeNote recipeNote) async {
    await database.update(database.recipeNoteDB).replace(
          RecipeNoteDBData(
            id: recipeNote.id!,
            data: RecipeNoteData.from(recipeNote),
            createdAt: recipeNote.createdAt,
            updatedAt: recipeNote.updatedAt,
          ),
        );
  }

  Future<void> delete(RecipeNote recipeNote) async {
    await (database.delete(database.recipeNoteDB)
          ..where((tbl) => tbl.id.isValue(recipeNote.id!)))
        .go();
  }
}

@riverpod
Stream<List<RecipeNote>> recipeNoteStream(RecipeNoteStreamRef ref) {
  final database = ref.watch(databaseProvider);
  final query = database.select(database.recipeNoteDB)
    ..orderBy([
      (t) => OrderingTerm(expression: t.updatedAt, mode: OrderingMode.desc),
    ]);
  return query.map((e) => e.toRecipeNote()).watch();
}
