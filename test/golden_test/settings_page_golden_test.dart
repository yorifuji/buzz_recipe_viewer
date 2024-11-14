// ignore_for_file: scoped_providers_should_specify_dependencies
import 'package:buzz_recipe_viewer/i18n/strings.g.dart';
import 'package:buzz_recipe_viewer/provider/package_info_provider.dart';
import 'package:buzz_recipe_viewer/provider/preference_provider.dart';
import 'package:buzz_recipe_viewer/provider/theme_data_provider.dart';
import 'package:buzz_recipe_viewer/ui/settings/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'flutter_test_config.dart';

void main() {
  final emptyDeviceBuilder = DeviceBuilder()
    ..addScenario(
      widget: ProviderScope(
        overrides: [
          packageInfoProvider.overrideWithValue(
            PackageInfo(
              appName: 'Buzz Recipe Viewer',
              packageName: 'com.example.buzz_recipe_viewer',
              version: '1.0.0',
              buildNumber: '1',
            ),
          ),
          boolPreferenceProvider(Preference.useInternalPlayer)
              .overrideWith(FakeTruePreference.new),
          themeDataProvider().overrideWith((ref) => ThemeData.light()),
          themeDataProvider(isDarkMode: true)
              .overrideWith((ref) => ThemeData.dark()),
        ],
        child: const SettingsPage(),
      ),
    );

  group('settings', () {
    testGoldens('ja', (tester) async {
      const locale = AppLocale.ja;
      // await LocaleSettings.setLocale(locale);
      await tester.pumpDeviceBuilder(emptyDeviceBuilder, wrapper: wrapper);
      await screenMatchesGolden(tester, '${locale.languageCode}/settings/page');
    });

    testGoldens('en', (tester) async {
      const locale = AppLocale.en;
      // await LocaleSettings.setLocale(locale);
      await tester.pumpDeviceBuilder(emptyDeviceBuilder, wrapper: wrapper);
      await screenMatchesGolden(tester, '${locale.languageCode}/settings/page');
    });
  });
}
