import 'package:buzz_recipe_viewer/gen/fonts.gen.dart';
import 'package:buzz_recipe_viewer/i18n/strings.g.dart';
import 'package:buzz_recipe_viewer/provider/user_provider.dart';
import 'package:buzz_recipe_viewer/repository/firestore/favorite_repository.dart';
import 'package:buzz_recipe_viewer/repository/firestore/recipe_repository.dart';
import 'package:buzz_recipe_viewer/service/preference_service.dart';
import 'package:buzz_recipe_viewer/ui/settings/common/custom_settings_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:settings_ui/settings_ui.dart';

class DebugPage extends ConsumerWidget {
  const DebugPage({super.key});

  static Widget show() => const DebugPage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(t.settings.general.row.color.title),
      ),
      body: CustomSettingsList(
        sections: [
          SettingsSection(
            title: Text(
              t.settings.debug.header,
              style: const TextStyle(fontFamily: FontFamily.notoSansJP),
            ),
            tiles: [
              SettingsTile(
                title: Text(
                  t.settings.debug.row.deleteLocalData.title,
                  style: const TextStyle(fontFamily: FontFamily.notoSansJP),
                ),
                onPressed: (_) async {
                  await HapticFeedback.selectionClick();
                  await ref.read(preferenceServiceProvider).clearAll();
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          t.settings.debug.row.deleteLocalData.title,
                        ),
                        duration: const Duration(seconds: 1),
                      ),
                    );
                  }
                },
              ),
              if (user.value != null) ...[
                SettingsTile(
                  title: Text(
                    t.settings.debug.row.firestoreCreateData.title,
                    style: const TextStyle(fontFamily: FontFamily.notoSansJP),
                  ),
                  onPressed: (_) async {
                    await HapticFeedback.selectionClick();
                    await ref.read(recipeRepositoryProvider).createDummyData();
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            t.settings.debug.row.firestoreCreateData.title,
                          ),
                          duration: const Duration(seconds: 1),
                        ),
                      );
                    }
                  },
                ),
                SettingsTile(
                  title: Text(
                    t.settings.debug.row.firestoreDeleteData.title,
                    style: const TextStyle(fontFamily: FontFamily.notoSansJP),
                  ),
                  onPressed: (_) async {
                    await HapticFeedback.selectionClick();
                    await ref.read(recipeRepositoryProvider).deleteAll();
                    await ref.read(favoriteRepositoryProvider).deleteAll();
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            t.settings.debug.row.firestoreDeleteData.title,
                          ),
                          duration: const Duration(seconds: 1),
                        ),
                      );
                    }
                  },
                ),
                SettingsTile(
                  title: Text(
                    t.settings.debug.row.addSampleRecipe.title,
                    style: const TextStyle(fontFamily: FontFamily.notoSansJP),
                  ),
                  onPressed: (_) async {
                    await HapticFeedback.selectionClick();
                    await ref.read(recipeRepositoryProvider).addSampleData();
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            t.settings.debug.row.addSampleRecipe.title,
                          ),
                          duration: const Duration(seconds: 1),
                        ),
                      );
                    }
                  },
                ),
                SettingsTile(
                  title: const Text(
                    'Copy Firebase UID',
                    style: TextStyle(fontFamily: FontFamily.notoSansJP),
                  ),
                  onPressed: (context) async {
                    await HapticFeedback.selectionClick();
                    await Clipboard.setData(
                      ClipboardData(text: user.value!.uid),
                    );
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Firebase UID: ${user.value!.uid}'),
                          duration: const Duration(seconds: 1),
                        ),
                      );
                    }
                  },
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
