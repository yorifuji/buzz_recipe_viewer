import 'package:buzz_recipe_viewer/gen/assets.gen.dart';
import 'package:buzz_recipe_viewer/i18n/strings.g.dart';
import 'package:buzz_recipe_viewer/model/recipe.dart';
import 'package:buzz_recipe_viewer/repository/firestore/recipe_provider.dart';
import 'package:buzz_recipe_viewer/repository/firestore/recipe_repository.dart';
import 'package:buzz_recipe_viewer/ui/common/app_bar.dart';
import 'package:buzz_recipe_viewer/ui/recipe/edit/recipe_edit_page.dart';
import 'package:buzz_recipe_viewer/ui/recipe/recipe_notifier.dart';
import 'package:buzz_recipe_viewer/ui/recipe/view/recipe_view_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RecipePage extends StatelessWidget {
  const RecipePage({super.key});

  static Widget show() => const RecipePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: t.recipe.title),
      body: const _RecipeDataWidget1(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await HapticFeedback.mediumImpact();
          if (context.mounted) {
            await Navigator.push(
              context,
              MaterialPageRoute<void>(
                builder: (_) => const RecipeEditPage(null),
              ),
            );
          }
        },
        tooltip: t.recipe.addRecipe,
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _RecipeDataWidget1 extends HookConsumerWidget {
  const _RecipeDataWidget1();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final windowSize = ref.watch(recipeWindowNotifierProvider);
    final stream = ref.watch(recipeStreamProvider(windowSize));

    final streamCache = useState<List<Recipe>?>(null);
    ref.listen(recipeStreamProvider(windowSize), (_, next) {
      if (next.hasValue) {
        streamCache.value = next.requireValue;
      }
    });

    Widget listViewWidget(List<Recipe> data) {
      final hasReachedEnd = data.length <= windowSize;
      final value = data.take(windowSize).toList();
      if (value.isEmpty) {
        return const _EmptyWidget();
      } else {
        return _RecipeListWidget(recipes: value, hasReachedEnd: hasReachedEnd);
      }
    }

    return RefreshIndicator(
      displacement: 0,
      strokeWidth: 2,
      child: stream.when(
        data: listViewWidget,
        loading: () {
          if (streamCache.value != null) {
            return listViewWidget(streamCache.value!);
          } else {
            return const Center(
              child: CircularProgressIndicator(strokeWidth: 2),
            );
          }
        },
        error: (_, __) => const _Errorwidget(),
      ),
      onRefresh: () async {
        ref.read(recipeWindowNotifierProvider.notifier).resetWindow();
        ref.invalidate(recipeStreamProvider(windowSize));
      },
    );
  }
}

class _RecipeListWidget extends ConsumerWidget {
  const _RecipeListWidget({required this.recipes, required this.hasReachedEnd});

  final List<Recipe> recipes;
  final bool hasReachedEnd;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      itemCount: hasReachedEnd ? recipes.length : recipes.length + 1,
      itemBuilder: (_, index) {
        final valuleKey = ValueKey(index);
        if (hasReachedEnd) {
          return _RecipeCardWidget(key: valuleKey, recipe: recipes[index]);
        } else {
          if (index == recipes.length) {
            return Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 16),
              child: TextButton(
                onPressed: () {
                  ref.read(recipeWindowNotifierProvider.notifier).growWindow();
                },
                child: Text(t.common.more),
              ),
            );
          } else {
            return _RecipeCardWidget(key: valuleKey, recipe: recipes[index]);
          }
        }
      },
    );
  }
}

class _RecipeCardWidget extends ConsumerWidget {
  const _RecipeCardWidget({required this.recipe, super.key});

  final Recipe recipe;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Dismissible(
        key: ValueKey(recipe),
        child: Card(
          child: ListTile(
            title: Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 8),
              child: Text(
                recipe.title,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            subtitle: Text(
              recipe.description,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (_) => RecipeViewPage(recipe),
                ),
              );
            },
          ),
        ),
        onDismissed: (_) async =>
            ref.read(recipeRepositoryProvider).delete(recipe),
      ),
    );
  }
}

class _EmptyWidget extends StatelessWidget {
  const _EmptyWidget();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Assets.images.recipe.image(width: 256, height: 256),
          const SizedBox(height: 16),
          Text(
            t.recipe.empty,
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}

class _Errorwidget extends ConsumerWidget {
  const _Errorwidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final windowSize = ref.watch(recipeWindowNotifierProvider);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Assets.images.error.image(width: 256, height: 256),
          TextButton(
            onPressed: () => ref.invalidate(recipeStreamProvider(windowSize)),
            child: Text(t.common.fetchFailed),
          ),
        ],
      ),
    );
  }
}
