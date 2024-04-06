import 'package:buzz_recipe_viewer/i18n/strings.g.dart';
import 'package:buzz_recipe_viewer/provider/package_info_provider.dart';
import 'package:buzz_recipe_viewer/ui/settings/settings_page.dart';
import 'package:buzz_recipe_viewer/ui/settings/settings_view_model.dart';
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
          settingsViewModelProvider.overrideWith(FakeSettingsViewModel.new),
        ],
        child: const SettingsPage(),
      ),
    );

  group('settings', () {
    testGoldens('ja', (tester) async {
      const locale = AppLocale.ja;
      LocaleSettings.setLocale(locale);
      await tester.pumpDeviceBuilder(emptyDeviceBuilder, wrapper: wrapper);
      await screenMatchesGolden(tester, '${locale.languageCode}/settings/page');
    });

    testGoldens('en', (tester) async {
      const locale = AppLocale.en;
      LocaleSettings.setLocale(locale);
      await tester.pumpDeviceBuilder(emptyDeviceBuilder, wrapper: wrapper);
      await screenMatchesGolden(tester, '${locale.languageCode}/settings/page');
    });
  });
}
