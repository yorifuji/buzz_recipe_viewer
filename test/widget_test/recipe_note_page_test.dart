import 'package:buzz_recipe_viewer/i18n/strings.g.dart';
import 'package:buzz_recipe_viewer/repository/recipe_note_repository.dart';
import 'package:buzz_recipe_viewer/repository/recipe_note_repository_mock.dart';
import 'package:buzz_recipe_viewer/ui/recipe/recipe_note_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  testWidgets('RecipeNotePage', (WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          recipeNoteStreamProvider.overrideWith(emptyRecipeNoteStream),
        ],
        child: const MaterialApp(home: RecipeNotePage()),
      ),
    );

    // Verify that RecipeNotePage is displayed
    await tester.pumpAndSettle();

    expect(find.text(t.recipe.addRecipe), findsOneWidget);
  });
}
