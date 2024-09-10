import 'package:buzz_recipe_viewer/i18n/strings.g.dart';
import 'package:buzz_recipe_viewer/model/recipe.dart';
import 'package:buzz_recipe_viewer/ui/recipe/edit/recipe_edit_notifier.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RecipeEditPage extends ConsumerWidget {
  const RecipeEditPage(this.recipe, {super.key});

  final Recipe? recipe;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(
      recipeEditNotifierProvider(recipe).notifier,
    );
    final isValid = ref.watch(
      recipeEditNotifierProvider(recipe).select((value) => value.isValid),
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
              _HeadlineContainer(recipe),
              const SizedBox(height: 16),
              _FoodListContainer(recipe),
              const SizedBox(height: 16),
              _StepListContainer(recipe),
              const SizedBox(height: 16),
              Center(child: Text(t.recipe.newRecipe.input.caution)),
              const SizedBox(height: 16),
              Center(
                child: FilledButton(
                  onPressed: isValid
                      ? () async {
                          if (recipe == null) {
                            await viewModel.onSave();
                            if (context.mounted) {
                              Navigator.pop(context);
                            }
                          } else {
                            await viewModel.onUpdate();
                            if (context.mounted) {
                              Navigator.popUntil(
                                context,
                                (route) => route.isFirst,
                              );
                            }
                          }
                        }
                      : null,
                  child: Text(t.recipe.newRecipe.input.save),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

class _HeadlineContainer extends ConsumerWidget {
  const _HeadlineContainer(this.recipe);

  final Recipe? recipe;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final title = ref.watch(
      recipeEditNotifierProvider(recipe).select((value) => value.title),
    );
    final description = ref.watch(
      recipeEditNotifierProvider(recipe).select((value) => value.description),
    );
    final viewModel = ref.watch(
      recipeEditNotifierProvider(recipe).notifier,
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
  const _FoodListContainer(this.recipe);

  final Recipe? recipe;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final foodList = ref.watch(
      recipeEditNotifierProvider(recipe).select((value) => value.foodList),
    );
    final viewModel = ref.watch(
      recipeEditNotifierProvider(recipe).notifier,
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
  const _StepListContainer(this.recipe);

  final Recipe? recipe;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stepList = ref.watch(
      recipeEditNotifierProvider(recipe).select((value) => value.stepList),
    );
    final viewModel = ref.watch(
      recipeEditNotifierProvider(recipe).notifier,
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
