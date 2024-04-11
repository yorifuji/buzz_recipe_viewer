import 'dart:io';

import 'package:buzz_recipe_viewer/i18n/strings.g.dart';
import 'package:buzz_recipe_viewer/provider/package_info_provider.dart';
import 'package:buzz_recipe_viewer/repository/shared_preferences_repository.dart';
import 'package:buzz_recipe_viewer/service/recipe_note_service.dart';
import 'package:buzz_recipe_viewer/ui/settings/color/color_setting_page.dart';
import 'package:buzz_recipe_viewer/ui/settings/common/custom_settings_list.dart';
import 'package:buzz_recipe_viewer/ui/settings/locale/locale_setting_page.dart';
import 'package:buzz_recipe_viewer/ui/settings/settings_view_model.dart';
import 'package:buzz_recipe_viewer/ui/settings/theme/theme_setting_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  static Widget show() => const SettingsPage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final packageInfo = ref.watch(packageInfoProvider);
    final useInternalPlayer = ref.watch(
      settingsViewModelProvider.select((value) => value.useInternalPlayer),
    );
    final viewModel = ref.watch(settingsViewModelProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text(t.settings.title),
      ),
      body: CustomSettingsList(
        sections: [
          SettingsSection(
            title: Text(t.settings.general.header),
            tiles: [
              SettingsTile.navigation(
                title: Text(t.settings.general.row.theme.title),
                onPressed: (context) {
                  Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) {
                        return const ThemeSettingPage();
                      },
                    ),
                  );
                },
              ),
              SettingsTile.navigation(
                title: Text(t.settings.general.row.color.title),
                onPressed: (context) {
                  Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) {
                        return const ColorSettingPage();
                      },
                    ),
                  );
                },
              ),
              SettingsTile.navigation(
                title: Text(t.settings.general.row.language.title),
                onPressed: (context) {
                  Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) {
                        return const LocaleSettingPage();
                      },
                    ),
                  );
                },
              ),
            ],
          ),
          SettingsSection(
            title: Text(t.settings.video.header),
            tiles: [
              SettingsTile.switchTile(
                title: Text(t.settings.video.row.playWithinApp.title),
                initialValue: useInternalPlayer,
                // web or macos
                description: kIsWeb || Platform.isMacOS
                    ? Text(t.settings.video.row.playWithinApp.description)
                    : null,
                enabled: !kIsWeb,
                onToggle: (value) =>
                    viewModel.setUseInternalPlayer(useInternalPlayer: value),
              ),
            ],
          ),
          SettingsSection(
            title: Text(t.settings.about.header),
            tiles: [
              SettingsTile(
                title: Text(t.settings.about.row.version.title),
                value:
                    Text('${packageInfo.version}(${packageInfo.buildNumber})'),
              ),
              SettingsTile(
                title: Text(t.settings.about.row.license.title),
                onPressed: (context) => showLicensePage(context: context),
              ),
            ],
          ),
          if (kDebugMode)
            SettingsSection(
              title: Text(t.settings.debug.header),
              tiles: [
                SettingsTile(
                  title: Text(t.settings.debug.row.dummyRecipe.title),
                  onPressed: (_) async {
                    await ref
                        .read(recipeNoteServiceProvider)
                        .createDummyRecipeNote();
                    // ignore: use_build_context_synchronously
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Add dummy recipe',
                          style: TextStyle(fontSize: 12),
                        ),
                        duration: Duration(seconds: 1),
                      ),
                    );
                  },
                ),
                SettingsTile(
                  title: const Text('Clear Shared Preference'),
                  onPressed: (_) async {
                    await ref.read(sharedPreferencesRepositoryProvider).clear();
                    ref.invalidate(sharedPreferencesRepositoryProvider);
                    // ignore: use_build_context_synchronously
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Clear Shared Preference',
                          style: TextStyle(fontSize: 12),
                        ),
                        duration: Duration(seconds: 1),
                      ),
                    );
                  },
                ),
              ],
            ),
        ],
      ),
    );
  }
}
