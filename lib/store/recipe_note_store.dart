import 'package:buzz_recipe_viewer/model/isar/recipe_note.dart';
import 'package:buzz_recipe_viewer/repository/database_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'recipe_note_store.g.dart';

@Riverpod(dependencies: [])
class RecipeNoteStore extends _$RecipeNoteStore {
  @override
  List<RecipeNote> build() {
    final databaseRepository = ref.watch(databaseRepositoryProvider);
    ref.onAddListener(() async {
      state = await databaseRepository.getRecipeNoteList;
    });
    databaseRepository.watchRecipeNotes(
      onChange: (_) async {
        state = await databaseRepository.getRecipeNoteList;
      },
    );
    return [];
  }
}
