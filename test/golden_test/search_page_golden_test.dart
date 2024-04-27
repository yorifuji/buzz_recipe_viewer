// ignore_for_file: scoped_providers_should_specify_dependencies
import 'package:buzz_recipe_viewer/i18n/strings.g.dart';
import 'package:buzz_recipe_viewer/repository/preference_repository.dart';
import 'package:buzz_recipe_viewer/ui/video/search_page.dart';
import 'package:buzz_recipe_viewer/ui/video/search_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'flutter_test_config.dart';

void main() {
  final emptyDeviceBuilder = DeviceBuilder()
    ..addScenario(
      widget: ProviderScope(
        overrides: [
          searchViewModelProvider.overrideWith(FakeSearchViewModel.new),
          boolPreferenceProvider(BoolPreferenceKey.useInternalPlayer)
              .overrideWith(FakeTruePreference.new),
        ],
        child: const SearchPage(),
      ),
    );

  group('search', () {
    testGoldens('ja', (tester) async {
      const locale = AppLocale.ja;
      LocaleSettings.setLocale(locale);
      await tester.pumpDeviceBuilder(emptyDeviceBuilder, wrapper: wrapper);
      await screenMatchesGolden(tester, '${locale.languageCode}/search/page');
    });

    testGoldens('en', (tester) async {
      const locale = AppLocale.en;
      LocaleSettings.setLocale(locale);
      await tester.pumpDeviceBuilder(emptyDeviceBuilder, wrapper: wrapper);
      await screenMatchesGolden(tester, '${locale.languageCode}/search/page');
    });
  });
}
