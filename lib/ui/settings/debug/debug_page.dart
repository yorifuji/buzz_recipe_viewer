import 'package:buzz_recipe_viewer/gen/fonts.gen.dart';
import 'package:buzz_recipe_viewer/i18n/strings.g.dart';
import 'package:buzz_recipe_viewer/provider/user_provider.dart';
import 'package:buzz_recipe_viewer/repository/firestore/favorite_repository.dart';
import 'package:buzz_recipe_viewer/repository/firestore/recipe_repository.dart';
import 'package:buzz_recipe_viewer/service/notification_service.dart';
import 'package:buzz_recipe_viewer/service/preference_service.dart';
import 'package:buzz_recipe_viewer/ui/settings/common/custom_settings_list.dart';
import 'package:firebase_app_installations/firebase_app_installations.dart';
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
        title: Text(t.settings.debug.header),
      ),
      body: CustomSettingsList(
        sections: [
          SettingsSection(
            title: Text(
              t.settings.debug.sections.general.title,
              style: const TextStyle(fontFamily: FontFamily.notoSansJP),
            ),
            tiles: [
              SettingsTile(
                title: Text(
                  t.settings.debug.sections.general.deleteLocalData.title,
                  style: const TextStyle(fontFamily: FontFamily.notoSansJP),
                ),
                onPressed: (_) async {
                  await HapticFeedback.mediumImpact();
                  await ref.read(preferenceServiceProvider).clearAll();
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          t.settings.debug.sections.general.deleteLocalData
                              .title,
                        ),
                        duration: const Duration(seconds: 1),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
          if (user.value != null)
            SettingsSection(
              title: Text(
                t.settings.debug.sections.firebase.title,
                style: const TextStyle(fontFamily: FontFamily.notoSansJP),
              ),
              tiles: [
                SettingsTile(
                  title: Text(
                    t.settings.debug.sections.firebase.firestoreCreateData
                        .title,
                    style: const TextStyle(fontFamily: FontFamily.notoSansJP),
                  ),
                  onPressed: (_) async {
                    await HapticFeedback.mediumImpact();
                    await ref.read(recipeRepositoryProvider).createDummyData();
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            t.settings.debug.sections.firebase
                                .firestoreCreateData.title,
                          ),
                          duration: const Duration(seconds: 1),
                        ),
                      );
                    }
                  },
                ),
                SettingsTile(
                  title: Text(
                    t.settings.debug.sections.firebase.firestoreDeleteData
                        .title,
                    style: const TextStyle(fontFamily: FontFamily.notoSansJP),
                  ),
                  onPressed: (_) async {
                    await HapticFeedback.mediumImpact();
                    await ref.read(recipeRepositoryProvider).deleteAll();
                    await ref.read(favoriteRepositoryProvider).deleteAll();
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            t.settings.debug.sections.firebase
                                .firestoreDeleteData.title,
                          ),
                          duration: const Duration(seconds: 1),
                        ),
                      );
                    }
                  },
                ),
                SettingsTile(
                  title: Text(
                    t.settings.debug.sections.firebase.addSampleRecipe.title,
                    style: const TextStyle(fontFamily: FontFamily.notoSansJP),
                  ),
                  onPressed: (_) async {
                    await HapticFeedback.mediumImpact();
                    await ref.read(recipeRepositoryProvider).addSampleData();
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            t.settings.debug.sections.firebase.addSampleRecipe
                                .title,
                          ),
                          duration: const Duration(seconds: 1),
                        ),
                      );
                    }
                  },
                ),
                SettingsTile(
                  title: Text(
                    t.settings.debug.sections.firebase.authUid.title,
                    style: const TextStyle(fontFamily: FontFamily.notoSansJP),
                  ),
                  onPressed: (context) async {
                    await HapticFeedback.mediumImpact();
                    await Clipboard.setData(
                      ClipboardData(text: user.value!.uid),
                    );
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(user.value!.uid),
                          duration: const Duration(seconds: 1),
                        ),
                      );
                    }
                  },
                ),
                SettingsTile(
                  title: Text(
                    t.settings.debug.sections.firebase.fcmToken.title,
                    style: const TextStyle(fontFamily: FontFamily.notoSansJP),
                  ),
                  onPressed: (context) async {
                    await HapticFeedback.mediumImpact();
                    final token = await NotificationService.getFcmToken();
                    if (token != null && context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(token),
                          duration: const Duration(seconds: 1),
                        ),
                      );
                      await Clipboard.setData(ClipboardData(text: token));
                    }
                  },
                ),
                SettingsTile(
                  title: Text(
                    t.settings.debug.sections.firebase.installationId.title,
                    style: const TextStyle(fontFamily: FontFamily.notoSansJP),
                  ),
                  onPressed: (context) async {
                    await HapticFeedback.mediumImpact();
                    final token = await FirebaseInstallations.instance.getId();
                    await Clipboard.setData(ClipboardData(text: token));
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(token),
                          duration: const Duration(seconds: 1),
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
        ],
      ),
    );
  }
}
