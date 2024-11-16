import 'dart:async';

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
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RecipePage extends ConsumerWidget {
  const RecipePage({super.key});

  static Widget show() => const RecipePage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recipeStream = ref.watch(recipeStreamProvider);
    return Scaffold(
      appBar: buildAppBar(context, title: t.recipe.title),
      body: RefreshIndicator(
        displacement: 0,
        strokeWidth: 2,
        child: recipeStream.when(
          skipLoadingOnReload: true,
          loading: () => const Center(
            child: CircularProgressIndicator(strokeWidth: 2),
          ),
          data: (data) => _RecipeListWidget(
            recipes: data.recipes,
            hasReachedEnd: data.hasReachedEnd,
            isReloading: recipeStream.isReloading,
          ),
          error: (_, __) => const _ErrorWidget(),
        ),
        onRefresh: () async {
          ref.read(recipeWindowNotifierProvider.notifier).resetWindow();
          ref.invalidate(recipeStreamProvider);
          unawaited(HapticFeedback.mediumImpact());
        },
      ),
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

class _RecipeListWidget extends ConsumerWidget {
  const _RecipeListWidget({
    required this.recipes,
    required this.hasReachedEnd,
    required this.isReloading,
  });

  final List<Recipe> recipes;
  final bool hasReachedEnd;
  final bool isReloading;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (recipes.isEmpty) {
      return const _EmptyWidget();
    } else {
      return ListView.builder(
        itemCount: hasReachedEnd ? recipes.length : recipes.length + 1,
        itemBuilder: (_, index) {
          final valuleKey = ValueKey(index);
          if (hasReachedEnd) {
            return _RecipeCardWidget(
              key: valuleKey,
              recipe: recipes[index],
            );
          } else {
            if (index == recipes.length) {
              return Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 16),
                child: isReloading
                    ? const Center(
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : TextButton(
                        onPressed: () {
                          ref
                              .read(recipeWindowNotifierProvider.notifier)
                              .growWindow();
                        },
                        child: Text(t.common.more),
                      ),
              );
            } else {
              return _RecipeCardWidget(
                key: valuleKey,
                recipe: recipes[index],
              );
            }
          }
        },
      );
    }
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

class _ErrorWidget extends ConsumerWidget {
  const _ErrorWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Assets.images.error.image(width: 256, height: 256),
          TextButton(
            onPressed: () => ref.invalidate(recipeStreamProvider),
            child: Text(t.common.fetchFailed),
          ),
        ],
      ),
    );
  }
}
