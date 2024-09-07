import 'package:buzz_recipe_viewer/i18n/strings.g.dart';
import 'package:buzz_recipe_viewer/repository/firestore/favorite_provider.dart';
import 'package:buzz_recipe_viewer/ui/favorite/favorite_notifier.dart';
import 'package:buzz_recipe_viewer/ui/favorite/favorite_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  testWidgets('FavoritePage', (WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          favoriteWindowNotifierProvider
              .overrideWith(FavoriteWindowNotifierrMock.new),
          favoriteStreamProvider(1).overrideWith((ref) => Stream.value([])),
        ],
        child: const MaterialApp(home: FavoritePage()),
      ),
    );

    await tester.pumpAndSettle();

    expect(
      find.text(t.favorite.empty),
      findsOneWidget,
    );
  });
}
