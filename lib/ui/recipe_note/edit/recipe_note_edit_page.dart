import 'package:buzz_recipe_viewer/i18n/strings.g.dart';
import 'package:buzz_recipe_viewer/model/isar/recipe_note.dart';
import 'package:buzz_recipe_viewer/ui/recipe_note/edit/recipe_note_edit_view_model.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RecipeNoteEditPage extends ConsumerWidget {
  const RecipeNoteEditPage({super.key, this.recipeNote});

  final RecipeNote? recipeNote;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(
      recipeNoteEditViewModelProvider(recipeNote: recipeNote).notifier,
    );
    final isValid = ref.watch(
      recipeNoteEditViewModelProvider(recipeNote: recipeNote)
          .select((value) => value.isValid),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(t.recipe.newRecipe.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _HeadlineContainer(recipeNote),
              const SizedBox(height: 16),
              _FoodListContainer(recipeNote),
              const SizedBox(height: 16),
              _StepListContainer(recipeNote),
              const SizedBox(height: 16),
              Center(child: Text(t.recipe.newRecipe.input.caution)),
              const SizedBox(height: 16),
              Center(
                child: FilledButton(
                  onPressed: isValid
                      ? () async {
                          if (recipeNote == null) {
                            await viewModel.onSave();
                            // ignore: use_build_context_synchronously
                            Navigator.pop(context);
                          } else {
                            await viewModel.onUpdate();
                            Navigator.popUntil(
                              // ignore: use_build_context_synchronously
                              context,
                              (route) => route.isFirst,
                            );
                          }
                        }
                      : null,
                  child: Text(t.recipe.newRecipe.input.save),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _HeadlineContainer extends ConsumerWidget {
  const _HeadlineContainer(this.recipeNote);

  final RecipeNote? recipeNote;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final title = ref.watch(
      recipeNoteEditViewModelProvider(recipeNote: recipeNote)
          .select((value) => value.title),
    );
    final description = ref.watch(
      recipeNoteEditViewModelProvider(recipeNote: recipeNote)
          .select((value) => value.description),
    );
    final viewModel = ref.watch(
      recipeNoteEditViewModelProvider(recipeNote: recipeNote).notifier,
    );
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextFormField(
              initialValue: title,
              decoration:
                  InputDecoration(hintText: t.recipe.newRecipe.input.title),
              onChanged: viewModel.updateTitle,
            ),
            const SizedBox(height: 8),
            TextFormField(
              initialValue: description,
              decoration: InputDecoration(
                hintText: t.recipe.newRecipe.input.description,
              ),
              onChanged: viewModel.updateDescription,
            ),
          ],
        ),
      ),
    );
  }
}

class _FoodListContainer extends ConsumerWidget {
  const _FoodListContainer(this.recipeNote);

  final RecipeNote? recipeNote;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final foodList = ref.watch(
      recipeNoteEditViewModelProvider(recipeNote: recipeNote)
          .select((value) => value.foodList),
    );
    final viewModel = ref.watch(
      recipeNoteEditViewModelProvider(recipeNote: recipeNote).notifier,
    );
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              t.recipe.newRecipe.input.ingredients,
              style: Theme.of(context).textTheme.labelLarge,
            ),
            Column(
              children: foodList
                  .mapIndexed(
                    (index, food) => Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 8),
                      child: TextFormField(
                        key: ValueKey(food.dateTime),
                        initialValue: food.text,
                        decoration: InputDecoration(
                          hintText: index == 0
                              ? t.recipe.newRecipe.input.ingredients_example
                              : null,
                          prefixIcon: index == 0
                              ? null
                              : InkWell(
                                  child: const Icon(Icons.clear),
                                  onTap: () =>
                                      viewModel.removeFoodListByIndex(index),
                                ),
                        ),
                        onChanged: (e) =>
                            viewModel.updateFoodListByIndex(e, index),
                      ),
                    ),
                  )
                  .toList(),
            ),
            ElevatedButton(
              onPressed: viewModel.extendFoodList,
              child: Text(t.recipe.newRecipe.input.add),
            ),
          ],
        ),
      ),
    );
  }
}

class _StepListContainer extends ConsumerWidget {
  const _StepListContainer(this.recipeNote);

  final RecipeNote? recipeNote;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stepList = ref.watch(
      recipeNoteEditViewModelProvider(recipeNote: recipeNote)
          .select((value) => value.stepList),
    );
    final viewModel = ref.watch(
      recipeNoteEditViewModelProvider(recipeNote: recipeNote).notifier,
    );
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              t.recipe.newRecipe.input.steps,
              style: Theme.of(context).textTheme.labelLarge,
            ),
            Column(
              children: stepList
                  .mapIndexed(
                    (index, step) => Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 8),
                      child: TextFormField(
                        key: ValueKey(step.dateTime),
                        initialValue: step.text,
                        decoration: InputDecoration(
                          hintText: index == 0
                              ? t.recipe.newRecipe.input.steps_example
                              : null,
                          prefixIcon: index == 0
                              ? null
                              : InkWell(
                                  child: const Icon(Icons.clear),
                                  onTap: () =>
                                      viewModel.removeStepListByIndex(index),
                                ),
                        ),
                        onChanged: (e) =>
                            viewModel.updateStepListByIndex(e, index),
                      ),
                    ),
                  )
                  .toList(),
            ),
            ElevatedButton(
              onPressed: viewModel.extendStepList,
              child: Text(t.recipe.newRecipe.input.add),
            ),
          ],
        ),
      ),
    );
  }
}
