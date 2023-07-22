import 'package:buzz_recipe_viewer/service/recipe_note_service.dart';
import 'package:buzz_recipe_viewer/store/recipe_note_store.dart';
import 'package:buzz_recipe_viewer/ui/recipe_note/edit/recipe_note_edit_page.dart';
import 'package:buzz_recipe_viewer/ui/recipe_note/view/recipe_note_view_page.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RecipeNotePage extends StatelessWidget {
  const RecipeNotePage({super.key});

  static Widget show() => const RecipeNotePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Recipe')),
      body: _RecipeNoteListContainer(),
    );
  }
}

class _RecipeNoteListContainer extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recipeNoteList = ref.watch(recipeNoteStoreProvider);
    return recipeNoteList.isEmpty
        ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.note_alt_outlined,
                  size: 32,
                ),
                const Text(
                  'We\'ve got no recipes.\nAdd your best ones!',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18),
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
                  child: const Text('Add Recipe'),
                ),
              ],
            ),
          )
        : SingleChildScrollView(
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
                              .delete(recipeNote);
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
                  child: const Text('Add Recipe'),
                ),
                const SizedBox(height: 32),
              ],
            ),
          );
  }
}
