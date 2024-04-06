import 'package:buzz_recipe_viewer/i18n/strings.g.dart';
import 'package:buzz_recipe_viewer/model/recipe_note.dart';
import 'package:buzz_recipe_viewer/repository/recipe_note_repository.dart';
import 'package:buzz_recipe_viewer/service/recipe_note_service.dart';
import 'package:buzz_recipe_viewer/ui/recipe_note/edit/recipe_note_edit_page.dart';
import 'package:buzz_recipe_viewer/ui/recipe_note/view/recipe_note_view_page.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RecipeNotePage extends ConsumerWidget {
  const RecipeNotePage({super.key});

  static Widget show() => const RecipeNotePage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recipeNoteStream = ref.watch(recipeNoteStreamProvider);
    final body = recipeNoteStream.when(
      data: (data) => data.isEmpty
          ? const _EmptyRecipeNoteListContainer()
          : _RecipeNoteListContainer(data),
      error: (error, stackTrace) => const CircularProgressIndicator(),
      loading: () => const CircularProgressIndicator(),
    );
    return Scaffold(appBar: AppBar(title: Text(t.recipe.title)), body: body);
  }
}

class _EmptyRecipeNoteListContainer extends StatelessWidget {
  const _EmptyRecipeNoteListContainer();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.note_alt_outlined,
            size: 32,
          ),
          const SizedBox(height: 16),
          Text(
            t.recipe.empty,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 16),
          FilledButton(
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) {
                    return const RecipeNoteEditPage();
                  },
                ),
              );
            },
            child: Text(t.recipe.addRecipe),
          ),
        ],
      ),
    );
  }
}

class _RecipeNoteListContainer extends ConsumerWidget {
  const _RecipeNoteListContainer(this.recipeNoteList);

  final List<RecipeNote> recipeNoteList;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: recipeNoteList.length,
            itemBuilder: (context, index) {
              final recipeNote = recipeNoteList[index];
              return Padding(
                padding: const EdgeInsets.all(8),
                child: Dismissible(
                  key: ValueKey(recipeNote),
                  child: Card(
                    child: ListTile(
                      title: Padding(
                        padding: const EdgeInsets.only(top: 8, bottom: 8),
                        child: Text(
                          recipeNote.title,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                      subtitle: Text(
                        recipeNote.description,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) {
                              return RecipeNoteViewPage(recipeNote);
                            },
                          ),
                        );
                      },
                    ),
                  ),
                  onDismissed: (_) async {
                    await ref
                        .read(recipeNoteServiceProvider)
                        .delete(recipeNoteList[index]);
                  },
                ),
              );
            },
          ),
          FilledButton(
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) {
                    return const RecipeNoteEditPage();
                  },
                ),
              );
            },
            child: Text(t.recipe.addRecipe),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
