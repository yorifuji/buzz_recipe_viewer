import 'package:buzz_recipe_viewer/gen/fonts.gen.dart';
import 'package:buzz_recipe_viewer/i18n/strings.g.dart';
import 'package:buzz_recipe_viewer/model/app_color.dart';
import 'package:buzz_recipe_viewer/store/app_color_notifier.dart';
import 'package:buzz_recipe_viewer/ui/settings/common/custom_settings_list.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:settings_ui/settings_ui.dart';

class ColorSettingPage extends ConsumerWidget {
  const ColorSettingPage({super.key});

  static Widget show() => const ColorSettingPage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appColor = ref.watch(appColorNotiferProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(t.settings.general.row.color.title),
      ),
      body: CustomSettingsList(
        sections: [
          SettingsSection(
            title: Text(
              t.settings.general.row.color.color.header,
              style: const TextStyle(fontFamily: FontFamily.notoSansJP),
            ),
            tiles: AppColor.values.map((e) {
              return SettingsTile(
                title: Text(
                  e.title,
                  style: const TextStyle(fontFamily: FontFamily.notoSansJP),
                ),
                leading: Icon(
                  Icons.circle,
                  color: e.color,
                ),
                trailing: e == appColor ? const Icon(Icons.check) : null,
                value: kIsWeb
                    ? e == appColor
                        ? Text(
                            t.common.selected,
                            style: const TextStyle(
                              fontFamily: FontFamily.notoSansJP,
                            ),
                          )
                        : null
                    : null,
                onPressed: (context) {
                  ref.read(appColorNotiferProvider.notifier).update(e);
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
