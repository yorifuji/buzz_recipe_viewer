import 'package:buzz_recipe_viewer/model/isar/recipe_note.dart';
import 'package:buzz_recipe_viewer/service/recipe_note_service.dart';
import 'package:collection/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mockito/mockito.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'recipe_note_edit_view_model.freezed.dart';
part 'recipe_note_edit_view_model.g.dart';

@freezed
class TextItem with _$TextItem {
  const factory TextItem({
    required String text,
    required DateTime dateTime,
  }) = _TextItem;
  const TextItem._();

  factory TextItem.empty() => TextItem(text: '', dateTime: DateTime.now());
}

@freezed
class RecipeNoteEditState with _$RecipeNoteEditState {
  const factory RecipeNoteEditState({
    @Default('') String title,
    @Default('') String description,
    @Default([]) List<TextItem> foodList,
    @Default([]) List<TextItem> stepList,
  }) = _RecipeNoteEditState;
  const RecipeNoteEditState._();

  factory RecipeNoteEditState.fromRecipeNote(RecipeNote recipeNote) {
    return RecipeNoteEditState(
      title: recipeNote.title,
      description: recipeNote.description,
      foodList: recipeNote.foodList
          .mapIndexed(
            (index, e) => TextItem(
              text: e,
              dateTime: DateTime.now().add(Duration(seconds: index)),
            ),
          )
          .toList(),
      stepList: recipeNote.stepList
          .mapIndexed(
            (index, e) => TextItem(
              text: e,
              dateTime: DateTime.now().add(Duration(seconds: index)),
            ),
          )
          .toList(),
    );
  }

  bool get isValid => title.isNotEmpty && description.isNotEmpty;
}

@Riverpod(dependencies: [])
class RecipeNoteEditViewModel extends _$RecipeNoteEditViewModel {
  late RecipeNoteService _recipeNoteService;
  @override
  RecipeNoteEditState build({RecipeNote? recipeNote}) {
    _recipeNoteService = ref.watch(recipeNoteServiceProvider);
    return recipeNote == null
        ? RecipeNoteEditState(
            foodList: [TextItem.empty()],
            stepList: [TextItem.empty()],
          )
        : RecipeNoteEditState.fromRecipeNote(recipeNote);
  }

  void updateTitle(String title) {
    state = state.copyWith(title: title);
  }

  void updateDescription(String description) {
    state = state.copyWith(description: description);
  }

  // update foodList by index
  void updateFoodListByIndex(String food, int index) {
    state = state.copyWith(
      foodList: state.foodList
          .mapIndexed(
            (i, value) => i == index ? value.copyWith(text: food) : value,
          )
          .toList(),
    );
  }

  // update stepList by index
  void updateStepListByIndex(String step, int index) {
    state = state.copyWith(
      stepList: state.stepList
          .mapIndexed(
            (i, value) => i == index ? value.copyWith(text: step) : value,
          )
          .toList(),
    );
  }

  // extend foodList
  void extendFoodList() =>
      state = state.copyWith(foodList: [...state.foodList, TextItem.empty()]);

  // extend stepList
  void extendStepList() =>
      state = state.copyWith(stepList: [...state.stepList, TextItem.empty()]);

  // remove foodList by index
  void removeFoodListByIndex(int index) {
    final foodList = state.foodList
        .where((item) => state.foodList.indexOf(item) != index)
        .toList();
    state = state.copyWith(foodList: foodList);
  }

  // remove stepList by index
  void removeStepListByIndex(int index) {
    final stepList = state.stepList
        .where((item) => state.stepList.indexOf(item) != index)
        .toList();
    state = state.copyWith(stepList: stepList);
  }

  Future<void> onSave() async {
    final recipeNote = state.toRecipeNote();
    await _recipeNoteService.add(recipeNote);
  }

  Future<void> onUpdate() async {
    final recipeNoteNew = state.toRecipeNote()..id = recipeNote!.id;
    await _recipeNoteService.add(recipeNoteNew);
  }
}

// RecipeNoteEditState から RecipeNote を生成するextension
extension RecipeNoteEditStateExtension on RecipeNoteEditState {
  RecipeNote toRecipeNote() => RecipeNote(
        title,
        description,
        foodList.map((item) => item.text).toList(),
        stepList.map((item) => item.text).toList(),
      );
}

class FakeRecipeNoteEditViewModel extends _$RecipeNoteEditViewModel
    with Mock
    implements RecipeNoteEditViewModel {
  @override
  RecipeNoteEditState build({RecipeNote? recipeNote}) =>
      const RecipeNoteEditState();
}
