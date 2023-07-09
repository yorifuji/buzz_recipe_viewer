import 'package:buzz_recipe_viewer/provider/package_info_provider.dart';
import 'package:buzz_recipe_viewer/ui/settings/settings_view_model.dart';
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
        title: const Text('Settings'),
      ),
      body: SettingsList(
        sections: [
          SettingsSection(
            title: const Text('動画'),
            tiles: <SettingsTile>[
              SettingsTile.switchTile(
                title: const Text('アプリ内で再生する'),
                initialValue: useInternalPlayer,
                onToggle: (value) =>
                    viewModel.setUseInternalPlayer(useInternalPlayer: value),
              )
            ],
          ),
          SettingsSection(
            title: const Text('このアプリについて'),
            tiles: <SettingsTile>[
              SettingsTile(
                title: const Text('バージョン'),
                value:
                    Text('${packageInfo.version}(${packageInfo.buildNumber})'),
              )
            ],
          ),
        ],
      ),
    );
  }
}
