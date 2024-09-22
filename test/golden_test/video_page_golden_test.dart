// ignore_for_file: scoped_providers_should_specify_dependencies
import 'package:buzz_recipe_viewer/i18n/strings.g.dart';
import 'package:buzz_recipe_viewer/provider/preference_provider.dart';
import 'package:buzz_recipe_viewer/ui/video/video_page.dart';
import 'package:buzz_recipe_viewer/ui/video/video_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'flutter_test_config.dart';

void main() {
  DeviceBuilder deviceBuilder(SearchViewModel Function() create) {
    return DeviceBuilder()
      ..addScenario(
        widget: ProviderScope(
          overrides: [
            searchViewModelProvider.overrideWith(create),
            boolPreferenceProvider(Preference.useInternalPlayer)
                .overrideWith(FakeTruePreference.new),
          ],
          child: const VideoPage(),
        ),
      );
  }

  final emptyDevice = deviceBuilder(FakeSearchViewModel.new);
  final errorDevice = deviceBuilder(FakeErrorSearchViewModel.new);

  group('empty', () {
    testGoldens('ja', (tester) async {
      const locale = AppLocale.ja;
      LocaleSettings.setLocale(locale);
      await tester.pumpDeviceBuilder(emptyDevice, wrapper: wrapper);
      await screenMatchesGolden(tester, '${locale.languageCode}/video/empty');
    });

    testGoldens('en', (tester) async {
      const locale = AppLocale.en;
      LocaleSettings.setLocale(locale);
      await tester.pumpDeviceBuilder(emptyDevice, wrapper: wrapper);
      await screenMatchesGolden(tester, '${locale.languageCode}/video/empty');
    });
  });

  group('error', () {
    testGoldens('ja', (tester) async {
      const locale = AppLocale.ja;
      LocaleSettings.setLocale(locale);
      await tester.pumpDeviceBuilder(errorDevice, wrapper: wrapper);
      await screenMatchesGolden(tester, '${locale.languageCode}/video/error');
    });

    testGoldens('en', (tester) async {
      const locale = AppLocale.en;
      LocaleSettings.setLocale(locale);
      await tester.pumpDeviceBuilder(errorDevice, wrapper: wrapper);
      await screenMatchesGolden(tester, '${locale.languageCode}/video/error');
    });
  });
}
