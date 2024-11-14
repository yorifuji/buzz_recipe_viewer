// ignore_for_file: scoped_providers_should_specify_dependencies
import 'package:buzz_recipe_viewer/i18n/strings.g.dart';
import 'package:buzz_recipe_viewer/repository/firestore/favorite_provider.dart';
import 'package:buzz_recipe_viewer/ui/favorite/favorite_notifier.dart';
import 'package:buzz_recipe_viewer/ui/favorite/favorite_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'flutter_test_config.dart';

void main() {
  const description = 'favorite';
  final deviceBuilder = DeviceBuilder()
    ..addScenario(
      widget: ProviderScope(
        overrides: [
          favoriteWindowNotifierProvider
              .overrideWith(FavoriteWindowNotifierrMock.new),
          favoriteStreamProvider.overrideWith((ref) => Stream.value([])),
        ],
        child: const FavoritePage(),
      ),
    );

  group(description, () {
    testGoldens('ja', (tester) async {
      const locale = AppLocale.ja;
      // await LocaleSettings.setLocale(locale);
      await tester.pumpDeviceBuilder(deviceBuilder, wrapper: wrapper);
      await screenMatchesGolden(
        tester,
        '${locale.languageCode}/$description/page',
      );
    });

    testGoldens('en', (tester) async {
      const locale = AppLocale.en;
      // await LocaleSettings.setLocale(locale);
      await tester.pumpDeviceBuilder(deviceBuilder, wrapper: wrapper);
      await screenMatchesGolden(
        tester,
        '${locale.languageCode}/$description/page',
      );
    });
  });
}
