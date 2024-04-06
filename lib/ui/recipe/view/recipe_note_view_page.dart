import 'package:buzz_recipe_viewer/i18n/strings.g.dart';
import 'package:buzz_recipe_viewer/model/recipe_note.dart';
import 'package:buzz_recipe_viewer/service/recipe_note_service.dart';
import 'package:buzz_recipe_viewer/ui/recipe/edit/recipe_note_edit_page.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RecipeNoteViewPage extends ConsumerWidget {
  const RecipeNoteViewPage(this.recipeNote, {super.key});

  final RecipeNote recipeNote;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(t.recipe.viewRecipe.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        recipeNote.title,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        recipeNote.description,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 16, bottom: 16),
                        child: Divider(),
                      ),
                      ...recipeNote.foodList.mapIndexed(
                        (index, e) => Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Text(
                            '${index + 1}. $e',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 16, bottom: 16),
                        child: Divider(),
                      ),
                      ...recipeNote.stepList.mapIndexed(
                        (index, e) => Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Text(
                            '${index + 1}. $e',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FilledButton(
                    onPressed: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) {
                            return RecipeNoteEditPage(recipeNote: recipeNote);
                          },
                        ),
                      );
                    },
                    child: Text(t.recipe.viewRecipe.edit),
                  ),
                  const SizedBox(width: 16),
                  FilledButton(
                    onPressed: () async {
                      await ref
                          .read(recipeNoteServiceProvider)
                          .delete(recipeNote);
                      // ignore: use_build_context_synchronously
                      Navigator.pop(context);
                    },
                    child: Text(t.recipe.viewRecipe.delete),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
