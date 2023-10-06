// ignore_for_file: scoped_providers_should_specify_dependencies
import 'package:buzz_recipe_viewer/store/recipe_note_store.dart';
import 'package:buzz_recipe_viewer/ui/recipe_note/recipe_note_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'fake_recipe_note_store.dart';

void main() {
  testWidgets('RecipeNotePage', (WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          recipeNoteStoreProvider.overrideWith(FakeRecipeNoteStore.new),
        ],
        child: const MaterialApp(home: RecipeNotePage()),
      ),
    );

    expect(find.text('Add Recipe'), findsOneWidget);
  });
}