import 'package:buzz_recipe_viewer/data/repository/firestore/recipe_repository.dart';
import 'package:buzz_recipe_viewer/domain/model/recipe.dart';
import 'package:buzz_recipe_viewer/i18n/strings.g.dart';
import 'package:buzz_recipe_viewer/ui/common/image_slide_modal_sheet.dart';
import 'package:buzz_recipe_viewer/ui/common/photo_slide_widget/photo_slide_widget.dart';
import 'package:buzz_recipe_viewer/ui/recipe/edit/recipe_edit_page.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RecipeViewPage extends ConsumerWidget {
  const RecipeViewPage(this.recipe, {super.key});

  final Recipe recipe;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageList = recipe.imageList.map((e) => e.url).toList();
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
                        recipe.title,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        recipe.description,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 16, bottom: 16),
                        child: Divider(),
                      ),
                      ...recipe.foodList.mapIndexed(
                        (index, e) => Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Text(
                            '${index + 1}. $e',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 16, bottom: 16),
                        child: Divider(),
                      ),
                      ...recipe.stepList.mapIndexed(
                        (index, e) => Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Text(
                            '${index + 1}. $e',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 32),
              if (recipe.imageList.isNotEmpty)
                AspectRatio(
                  aspectRatio: 2,
                  child: PhotoSlideWidget(
                    urls: imageList,
                    onTapImage: (index) {
                      showImageSlideModalSheet(
                        context,
                        imageList,
                        initialIndex: index,
                      );
                    },
                  ),
                ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FilledButton(
                    onPressed: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) {
                            return RecipeEditPage(recipe);
                          },
                        ),
                      );
                    },
                    child: Text(t.recipe.viewRecipe.edit),
                  ),
                  const SizedBox(width: 16),
                  FilledButton(
                    onPressed: () async {
                      await ref.read(recipeRepositoryProvider).delete(recipe);
                      if (context.mounted) {
                        Navigator.pop(context);
                      }
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
