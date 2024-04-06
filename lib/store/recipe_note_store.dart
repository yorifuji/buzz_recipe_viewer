import 'package:buzz_recipe_viewer/model/isar/recipe_note.dart';
import 'package:buzz_recipe_viewer/repository/database_repository.dart';
import 'package:mockito/mockito.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'recipe_note_store.g.dart';

@riverpod
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

class FakeEmptyRecipeNoteStore extends _$RecipeNoteStore
    with Mock
    implements RecipeNoteStore {
  @override
  List<RecipeNote> build() {
    return [];
  }
}

class FakeRecipeNoteStore extends _$RecipeNoteStore implements RecipeNoteStore {
  @override
  List<RecipeNote> build() {
    return [
      RecipeNote('title1', 'description1', [], []),
      RecipeNote('title2', 'description2', [], []),
    ];
  }
}
