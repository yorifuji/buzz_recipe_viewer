import 'package:buzz_recipe_viewer/i18n/strings.g.dart';
import 'package:buzz_recipe_viewer/model/app_color.dart';
import 'package:buzz_recipe_viewer/provider/app_color_preference_provider.dart';
import 'package:buzz_recipe_viewer/service/app_color_service.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:settings_ui/settings_ui.dart';

class ColorSettingPage extends ConsumerWidget {
  const ColorSettingPage({super.key});

  static Widget show() => const ColorSettingPage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appColor = ref.watch(appColorPreferenceProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(t.settings.general.row.color.title),
      ),
      body: SettingsList(
        sections: [
          SettingsSection(
            title: Text(t.settings.general.row.color.color.header),
            tiles: AppColor.values.map((e) {
              return SettingsTile(
                title: Text(e.title),
                leading: Icon(
                  Icons.circle,
                  color: e.color,
                ),
                trailing: e == appColor ? const Icon(Icons.check) : null,
                onPressed: (context) {
                  ref.read(appColorServiceProvider).setAppColor(e);
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
