import 'package:buzz_recipe_viewer/store/favorite_store.dart';
import 'package:buzz_recipe_viewer/ui/favorite/favorite_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  testWidgets('FavoritePage', (WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          favoriteStoreProvider.overrideWith(FakeFavoriteStore.new),
        ],
        child: const MaterialApp(home: FavoritePage()),
      ),
    );

    expect(
      find.text('Love a video?\nTap the heart to make it your fave!'),
      findsOneWidget,
    );
  });
}
