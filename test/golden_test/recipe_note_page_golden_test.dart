import 'package:buzz_recipe_viewer/i18n/strings.g.dart';
import 'package:buzz_recipe_viewer/store/recipe_note_store.dart';
import 'package:buzz_recipe_viewer/ui/recipe_note/recipe_note_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'flutter_test_config.dart';

void main() {
  final emptyDeviceBuilder = DeviceBuilder()
    ..addScenario(
      widget: ProviderScope(
        overrides: [
          recipeNoteStoreProvider.overrideWith(FakeEmptyRecipeNoteStore.new),
        ],
        child: const RecipeNotePage(),
      ),
    );

  final listDeviceBuilder = DeviceBuilder()
    ..addScenario(
      widget: ProviderScope(
        overrides: [
          recipeNoteStoreProvider.overrideWith(FakeRecipeNoteStore.new),
        ],
        child: const RecipeNotePage(),
      ),
    );

  group('recipe_note', () {
    testGoldens('ja', (tester) async {
      const locale = AppLocale.ja;
      LocaleSettings.setLocale(locale);
      await tester.pumpDeviceBuilder(emptyDeviceBuilder, wrapper: wrapper);
      await screenMatchesGolden(
        tester,
        '${locale.languageCode}/recipe_note/empty',
      );
    });

    testGoldens('en', (tester) async {
      const locale = AppLocale.en;
      LocaleSettings.setLocale(locale);
      await tester.pumpDeviceBuilder(emptyDeviceBuilder, wrapper: wrapper);
      await screenMatchesGolden(
        tester,
        '${locale.languageCode}/recipe_note/empty',
      );
    });
  });

  group('list', () {
    testGoldens('ja', (tester) async {
      const locale = AppLocale.ja;
      LocaleSettings.setLocale(locale);
      await tester.pumpDeviceBuilder(listDeviceBuilder, wrapper: wrapper);
      await screenMatchesGolden(
        tester,
        '${locale.languageCode}/recipe_note/list',
      );
    });

    testGoldens('en', (tester) async {
      const locale = AppLocale.en;
      LocaleSettings.setLocale(locale);
      await tester.pumpDeviceBuilder(listDeviceBuilder, wrapper: wrapper);
      await screenMatchesGolden(
        tester,
        '${locale.languageCode}/recipe_note/list',
      );
    });
  });
}
