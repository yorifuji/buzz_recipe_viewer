import 'package:buzz_recipe_viewer/i18n/strings.g.dart';
import 'package:buzz_recipe_viewer/store/recipe_note_store.dart';
import 'package:buzz_recipe_viewer/ui/recipe_note/recipe_note_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../fake_recipe_note_store.dart';
import 'flutter_test_config.dart';

void main() {
  const description = 'RecipeNotePage';
  final deviceBuilder = DeviceBuilder()
    ..addScenario(
      widget: ProviderScope(
        overrides: [
          recipeNoteStoreProvider.overrideWith(FakeRecipeNoteStore.new),
        ],
        child: const RecipeNotePage(),
      ),
    );

  group(description, () {
    testGoldens('ja', (tester) async {
      const locale = AppLocale.ja;
      LocaleSettings.setLocale(locale);
      await tester.pumpDeviceBuilder(deviceBuilder, wrapper: wrapper);
      await screenMatchesGolden(tester, '${locale.languageCode}/$description');
    });

    testGoldens('en', (tester) async {
      const locale = AppLocale.en;
      LocaleSettings.setLocale(locale);
      await tester.pumpDeviceBuilder(deviceBuilder, wrapper: wrapper);
      await screenMatchesGolden(tester, '${locale.languageCode}/$description');
    });
  });
}
