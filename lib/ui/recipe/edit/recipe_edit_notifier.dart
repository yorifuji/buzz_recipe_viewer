import 'package:buzz_recipe_viewer/model/recipe.dart';
import 'package:buzz_recipe_viewer/repository/firestore/recipe_repository.dart';
import 'package:collection/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mockito/mockito.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'recipe_edit_notifier.freezed.dart';
part 'recipe_edit_notifier.g.dart';

@freezed
class TextItem with _$TextItem {
  const factory TextItem({
    required String text,
    required DateTime dateTime,
  }) = _TextItem;
  const TextItem._();

  factory TextItem.empty() => TextItem(text: '', dateTime: DateTime.now());
  factory TextItem.fromIndex(int index, String text) => TextItem(
        text: text,
        dateTime: DateTime.now().add(Duration(seconds: index)),
      );
}

@freezed
class RecipeEditState with _$RecipeEditState {
  const factory RecipeEditState({
    Recipe? recipe,
    String? id,
    @Default('') String title,
    @Default('') String description,
    @Default([]) List<TextItem> foodList,
    @Default([]) List<TextItem> stepList,
  }) = _RecipeEditState;
  const RecipeEditState._();

  factory RecipeEditState.empty() => RecipeEditState(
        foodList: [TextItem.empty()],
        stepList: [TextItem.empty()],
      );

  factory RecipeEditState.fromRecipe(Recipe recipe) {
    return RecipeEditState(
      recipe: recipe,
      id: recipe.id,
      title: recipe.title,
      description: recipe.description,
      foodList: recipe.foodList.mapIndexed(TextItem.fromIndex).toList(),
      stepList: recipe.stepList.mapIndexed(TextItem.fromIndex).toList(),
    );
  }

  bool get isValid => title.isNotEmpty && description.isNotEmpty;
}

@riverpod
class RecipeEditNotifier extends _$RecipeEditNotifier {
  @override
  RecipeEditState build(Recipe? recipe) => recipe == null
      ? RecipeEditState.empty()
      : RecipeEditState.fromRecipe(recipe);

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
    final recipe = state.toRecipe();
    await ref.read(recipeRepositoryProvider).create(recipe);
  }

  Future<void> onUpdate() async {
    final recipe = state.toRecipe(isUpdate: true);
    await ref.read(recipeRepositoryProvider).update(recipe);
  }
}

// RecipeEditState から Recipe を生成するextension
extension RecipeEditStateExtension on RecipeEditState {
  Recipe toRecipe({bool isUpdate = false}) {
    final now = DateTime.now();
    return Recipe(
      id: id,
      title: title,
      description: description,
      foodList: foodList.map((item) => item.text).toList(),
      stepList: stepList.map((item) => item.text).toList(),
      createdAt: isUpdate ? recipe!.createdAt : now,
      updatedAt: now,
    );
  }
}

class FakeRecipeEditNotifier extends _$RecipeEditNotifier
    with Mock
    implements RecipeEditNotifier {
  @override
  RecipeEditState build(Recipe? recipe) => const RecipeEditState();
}
