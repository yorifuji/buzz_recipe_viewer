import 'package:buzz_recipe_viewer/i18n/strings.g.dart';
import 'package:buzz_recipe_viewer/provider/theme_mode_preference_provider.dart';
import 'package:buzz_recipe_viewer/repository/shared_preferences_repository.dart';
import 'package:buzz_recipe_viewer/service/theme_service.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:settings_ui/settings_ui.dart';

class ThemeSettingPage extends ConsumerWidget {
  const ThemeSettingPage({super.key});

  static Widget show() => const ThemeSettingPage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeModePreferenceProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(t.settings.general.row.theme.title),
      ),
      body: SettingsList(
        sections: [
          SettingsSection(
            title: Text(t.settings.general.row.theme.theme.header),
            tiles: ThemeModePreference.values
                .mapIndexed(
                  (index, e) => SettingsTile(
                    title: Text(
                      t.settings.general.row.theme.theme.row[index],
                    ),
                    trailing:
                        theme == e.themeMode ? const Icon(Icons.check) : null,
                    onPressed: (context) async {
                      await ref
                          .read(themeServiceProvider)
                          .setThemeModePreference(e);
                    },
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
