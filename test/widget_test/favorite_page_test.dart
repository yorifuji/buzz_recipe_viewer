import 'package:buzz_recipe_viewer/i18n/strings.g.dart';
import 'package:buzz_recipe_viewer/repository/favorite_repository.dart';
import 'package:buzz_recipe_viewer/repository/favorite_repository_mock.dart';
import 'package:buzz_recipe_viewer/ui/favorite/favorite_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  testWidgets('FavoritePage', (WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          favoriteStreamProvider.overrideWith(emptyFavoriteStream),
        ],
        child: const MaterialApp(home: FavoritePage()),
      ),
    );

    // Verify that RecipeNotePage is displayed
    await tester.pumpAndSettle();

    expect(
      find.text(t.favorite.empty),
      findsOneWidget,
    );
  });
}
