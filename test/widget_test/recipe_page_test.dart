import 'package:buzz_recipe_viewer/data/repository/firestore/recipe_provider.dart';
import 'package:buzz_recipe_viewer/i18n/strings.g.dart';
import 'package:buzz_recipe_viewer/ui/recipe/recipe_notifier.dart';
import 'package:buzz_recipe_viewer/ui/recipe/recipe_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  testWidgets('RecipePage', (WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          recipeWindowNotifierProvider
              .overrideWith(RecipeWindowNotifierMock.new),
          recipeStreamProvider.overrideWith(
            (ref) => Stream.value((recipes: [], hasReachedEnd: true)),
          ),
        ],
        child: const MaterialApp(home: RecipePage()),
      ),
    );

    await tester.pumpAndSettle();

    expect(
      find.text(t.recipe.empty),
      findsOneWidget,
    );
  });
}
