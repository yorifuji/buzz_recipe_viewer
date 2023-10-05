import 'package:buzz_recipe_viewer/model/isar/recipe_note.dart';
import 'package:buzz_recipe_viewer/store/recipe_note_store.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'fake_recipe_note_store.g.dart';

@riverpod
class FakeRecipeNoteStore extends _$FakeRecipeNoteStore
    implements RecipeNoteStore {
  @override
  List<RecipeNote> build() {
    return [];
  }
}
