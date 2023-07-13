import 'package:buzz_recipe_viewer/provider/theme_provider.dart';
import 'package:buzz_recipe_viewer/repository/shared_preferences_repository.dart';
import 'package:buzz_recipe_viewer/ui/settings/theme/theme_setting_view_model.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:settings_ui/settings_ui.dart';

class ThemeSettingPage extends ConsumerWidget {
  const ThemeSettingPage({super.key});

  static Widget show() => const ThemeSettingPage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(themeProvider.notifier);
    final theme = ref.watch(themeProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme'),
      ),
      body: SettingsList(
        sections: [
          SettingsSection(
            title: const Text('テーマ'),
            tiles: ThemeModePreference.values
                .map(
                  (e) => SettingsTile(
                    title: Text(e.title),
                    trailing:
                        theme == e.themeMode ? const Icon(Icons.check) : null,
                    onPressed: (context) =>
                        viewModel.changeAndSave(e.themeMode),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}