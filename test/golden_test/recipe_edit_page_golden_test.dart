// ignore_for_file: scoped_providers_should_specify_dependencies
import 'package:buzz_recipe_viewer/i18n/strings.g.dart';
import 'package:buzz_recipe_viewer/ui/recipe/edit/recipe_edit_notifier.dart';
import 'package:buzz_recipe_viewer/ui/recipe/edit/recipe_edit_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'flutter_test_config.dart';

void main() {
  final emptyDeviceBuilder = DeviceBuilder()
    ..addScenario(
      widget: ProviderScope(
        overrides: [
          recipeEditNotifierProvider(null)
              .overrideWith(FakeRecipeEditNotifier.new),
        ],
        child: const RecipeEditPage(null),
      ),
    );

  group('recipe_edit', () {
    testGoldens('ja', (tester) async {
      const locale = AppLocale.ja;
      // await LocaleSettings.setLocale(locale);
      await tester.pumpDeviceBuilder(emptyDeviceBuilder, wrapper: wrapper);
      await screenMatchesGolden(
        tester,
        '${locale.languageCode}/recipe_edit/empty',
      );
    });

    testGoldens('en', (tester) async {
      const locale = AppLocale.en;
      // await LocaleSettings.setLocale(locale);
      await tester.pumpDeviceBuilder(emptyDeviceBuilder, wrapper: wrapper);
      await screenMatchesGolden(
        tester,
        '${locale.languageCode}/recipe_edit/empty',
      );
    });
  });
}
