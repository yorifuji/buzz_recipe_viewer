import 'package:buzz_recipe_viewer/gen/fonts.gen.dart';
import 'package:buzz_recipe_viewer/i18n/strings.g.dart';
import 'package:buzz_recipe_viewer/model/locale_preference.dart';
import 'package:buzz_recipe_viewer/store/locale_notifier.dart';
import 'package:buzz_recipe_viewer/ui/settings/common/custom_settings_list.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:settings_ui/settings_ui.dart';

class LocaleSettingPage extends ConsumerWidget {
  const LocaleSettingPage({super.key});

  static Widget show() => const LocaleSettingPage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(localeNotiferProvider).toLocale;

    return Scaffold(
      appBar: AppBar(
        title: Text(t.settings.general.row.language.title),
      ),
      body: CustomSettingsList(
        sections: [
          SettingsSection(
            title: Text(
              t.settings.general.row.language.language.header,
              style: const TextStyle(fontFamily: FontFamily.notoSansJP),
            ),
            tiles: LocalePreference.values
                .mapIndexed(
                  (index, e) => SettingsTile(
                    title: Text(
                      t.settings.general.row.language.language.row[index],
                      style: const TextStyle(fontFamily: FontFamily.notoSansJP),
                    ),
                    value: kIsWeb
                        ? locale == e.toLocale
                            ? Text(
                                t.settings.common.selected,
                                style: const TextStyle(
                                  fontFamily: FontFamily.notoSansJP,
                                ),
                              )
                            : null
                        : null,
                    trailing:
                        locale == e.toLocale ? const Icon(Icons.check) : null,
                    onPressed: (context) async {
                      await ref.read(localeNotiferProvider.notifier).update(e);
                      await WidgetsFlutterBinding.ensureInitialized()
                          .performReassemble();
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
