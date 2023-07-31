import 'package:buzz_recipe_viewer/model/locale_preference.dart';
import 'package:buzz_recipe_viewer/provider/locale_preference_provider.dart';
import 'package:buzz_recipe_viewer/service/locale_service.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:settings_ui/settings_ui.dart';

class LocaleSettingPage extends ConsumerWidget {
  const LocaleSettingPage({super.key});

  static Widget show() => const LocaleSettingPage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(localePreferenceProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('言語設定'),
      ),
      body: SettingsList(
        sections: [
          SettingsSection(
            title: const Text('言語'),
            tiles: LocalePreference.values
                .map(
                  (e) => SettingsTile(
                    title: Text(e.title),
                    trailing:
                        locale == e.toLocale ? const Icon(Icons.check) : null,
                    onPressed: (context) async {
                      await ref.read(localeServiceProvider).setLocale(e);
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
