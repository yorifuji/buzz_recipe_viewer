import 'package:buzz_recipe_viewer/gen/fonts.gen.dart';
import 'package:buzz_recipe_viewer/i18n/strings.g.dart';
import 'package:buzz_recipe_viewer/model/theme_preference.dart';
import 'package:buzz_recipe_viewer/store/theme_notifier.dart';
import 'package:buzz_recipe_viewer/ui/settings/common/custom_settings_list.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:settings_ui/settings_ui.dart';

class ThemeSettingPage extends ConsumerWidget {
  const ThemeSettingPage({super.key});

  static Widget show() => const ThemeSettingPage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeNotiferProvider).themeMode;
    return Scaffold(
      appBar: AppBar(
        title: Text(t.settings.general.row.theme.title),
      ),
      body: CustomSettingsList(
        sections: [
          SettingsSection(
            title: Text(
              t.settings.general.row.theme.theme.header,
              style: const TextStyle(fontFamily: FontFamily.notoSansJP),
            ),
            tiles: ThemePreference.values
                .mapIndexed(
                  (index, e) => SettingsTile(
                    title: Text(
                      t.settings.general.row.theme.theme.row[index],
                      style: const TextStyle(fontFamily: FontFamily.notoSansJP),
                    ),
                    trailing:
                        theme == e.themeMode ? const Icon(Icons.check) : null,
                    value: kIsWeb
                        ? theme == e.themeMode
                            ? Text(
                                t.settings.selected,
                                style: const TextStyle(
                                  fontFamily: FontFamily.notoSansJP,
                                ),
                              )
                            : null
                        : null,
                    onPressed: (context) async {
                      await ref.read(themeNotiferProvider.notifier).update(e);
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
