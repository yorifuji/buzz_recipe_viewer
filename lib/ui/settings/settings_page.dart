import 'dart:io' show Platform;

import 'package:buzz_recipe_viewer/gen/fonts.gen.dart';
import 'package:buzz_recipe_viewer/i18n/strings.g.dart';
import 'package:buzz_recipe_viewer/provider/database_provider.dart';
import 'package:buzz_recipe_viewer/provider/flavor_provider.dart';
import 'package:buzz_recipe_viewer/provider/package_info_provider.dart';
import 'package:buzz_recipe_viewer/repository/preference_repository.dart';
import 'package:buzz_recipe_viewer/service/preference_service.dart';
import 'package:buzz_recipe_viewer/service/recipe_note_service.dart';
import 'package:buzz_recipe_viewer/ui/settings/color/color_setting_page.dart';
import 'package:buzz_recipe_viewer/ui/settings/common/custom_settings_list.dart';
import 'package:buzz_recipe_viewer/ui/settings/locale/locale_setting_page.dart';
import 'package:buzz_recipe_viewer/ui/settings/notification/notification_setting_page.dart';
import 'package:buzz_recipe_viewer/ui/settings/theme/theme_setting_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  static Widget show() => const SettingsPage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final packageInfo = ref.watch(packageInfoProvider);
    final isInternalPlayerAvailable = !kIsWeb && !Platform.isMacOS;
    final useInternalPlayer = isInternalPlayerAvailable &&
        ref.watch(boolPreferenceProvider(Preference.useInternalPlayer));

    return Scaffold(
      appBar: AppBar(
        title: Text(t.settings.title),
      ),
      body: CustomSettingsList(
        sections: [
          SettingsSection(
            title: Text(
              t.settings.general.header,
              style: const TextStyle(fontFamily: FontFamily.notoSansJP),
            ),
            tiles: [
              SettingsTile.navigation(
                title: Text(
                  t.settings.general.row.theme.title,
                  style: const TextStyle(fontFamily: FontFamily.notoSansJP),
                ),
                onPressed: (context) {
                  Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) {
                        return const ThemeSettingPage();
                      },
                    ),
                  );
                },
              ),
              SettingsTile.navigation(
                title: Text(
                  t.settings.general.row.color.title,
                  style: const TextStyle(fontFamily: FontFamily.notoSansJP),
                ),
                onPressed: (context) {
                  Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) {
                        return const ColorSettingPage();
                      },
                    ),
                  );
                },
              ),
              SettingsTile.navigation(
                title: Text(
                  t.settings.general.row.language.title,
                  style: const TextStyle(fontFamily: FontFamily.notoSansJP),
                ),
                onPressed: (context) async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) {
                        return const LocaleSettingPage();
                      },
                    ),
                  );
                  await WidgetsFlutterBinding.ensureInitialized()
                      .performReassemble();
                },
              ),
              if (Platform.isIOS || Platform.isAndroid)
                SettingsTile.navigation(
                  title: Text(
                    t.settings.general.notifications.title,
                    style: const TextStyle(fontFamily: FontFamily.notoSansJP),
                  ),
                  onPressed: (context) async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) {
                          return const NotificationSettingPage();
                        },
                      ),
                    );
                  },
                ),
            ],
          ),
          SettingsSection(
            title: Text(
              t.settings.video.header,
              style: const TextStyle(fontFamily: FontFamily.notoSansJP),
            ),
            tiles: [
              SettingsTile.switchTile(
                title: Text(
                  t.settings.video.row.playWithinApp.title,
                  style: const TextStyle(fontFamily: FontFamily.notoSansJP),
                ),
                initialValue: useInternalPlayer,
                // web or macos
                description: isInternalPlayerAvailable
                    ? null
                    : Text(
                        t.settings.video.row.playWithinApp.description,
                        style:
                            const TextStyle(fontFamily: FontFamily.notoSansJP),
                      ),
                enabled: isInternalPlayerAvailable,
                onToggle: (value) => ref
                    .read(
                      boolPreferenceProvider(
                        Preference.useInternalPlayer,
                      ).notifier,
                    )
                    .update(value),
              ),
            ],
          ),
          if (kDebugMode || !ref.watch(flavorProvider).isProd)
            SettingsSection(
              title: Text(
                t.settings.support.header,
                style: const TextStyle(fontFamily: FontFamily.notoSansJP),
              ),
              tiles: [
                SettingsTile.navigation(
                  title: Text(
                    t.settings.support.row.help.title,
                    style: const TextStyle(fontFamily: FontFamily.notoSansJP),
                  ),
                  onPressed: (context) =>
                      _openBrowser(url: 'https://flutter.dev/'),
                ),
                SettingsTile.navigation(
                  title: Text(
                    t.settings.support.row.contact.title,
                    style: const TextStyle(fontFamily: FontFamily.notoSansJP),
                  ),
                  onPressed: (context) =>
                      _openBrowser(url: 'https://flutter.dev/'),
                ),
                SettingsTile.navigation(
                  title: Text(
                    t.settings.support.row.feedback.title,
                    style: const TextStyle(fontFamily: FontFamily.notoSansJP),
                  ),
                  onPressed: (context) =>
                      _openBrowser(url: 'https://flutter.dev/'),
                ),
                if (!kIsWeb)
                  SettingsTile(
                    title: Text(
                      t.settings.support.row.review.title,
                      style: const TextStyle(fontFamily: FontFamily.notoSansJP),
                    ),
                    onPressed: (context) async {
                      final inAppReview = InAppReview.instance;
                      if (await inAppReview.isAvailable()) {
                        await inAppReview.requestReview();
                      }
                    },
                  ),
                SettingsTile(
                  title: Text(
                    t.settings.support.row.share.title,
                    style: const TextStyle(fontFamily: FontFamily.notoSansJP),
                  ),
                  onPressed: (context) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Not implemented')),
                    );
                  },
                ),
              ],
            ),
          SettingsSection(
            title: Text(
              t.settings.about.header,
              style: const TextStyle(fontFamily: FontFamily.notoSansJP),
            ),
            tiles: [
              if (kDebugMode || !ref.watch(flavorProvider).isProd) ...[
                SettingsTile.navigation(
                  title: Text(
                    t.settings.about.row.terms.title,
                    style: const TextStyle(fontFamily: FontFamily.notoSansJP),
                  ),
                  onPressed: (context) =>
                      _openBrowser(url: 'https://flutter.dev/'),
                ),
                SettingsTile.navigation(
                  title: Text(
                    t.settings.about.row.privacy.title,
                    style: const TextStyle(fontFamily: FontFamily.notoSansJP),
                  ),
                  onPressed: (context) =>
                      _openBrowser(url: 'https://flutter.dev/'),
                ),
              ],
              SettingsTile.navigation(
                title: Text(
                  t.settings.about.row.license.title,
                  style: const TextStyle(fontFamily: FontFamily.notoSansJP),
                ),
                onPressed: (context) => showLicensePage(context: context),
              ),
              SettingsTile(
                title: Text(
                  t.settings.about.row.version.title,
                  style: const TextStyle(fontFamily: FontFamily.notoSansJP),
                ),
                value:
                    Text('${packageInfo.version}(${packageInfo.buildNumber})'),
              ),
            ],
          ),
          if (kDebugMode || !ref.watch(flavorProvider).isProd)
            SettingsSection(
              title: Text(
                t.settings.debug.header,
                style: const TextStyle(fontFamily: FontFamily.notoSansJP),
              ),
              tiles: [
                SettingsTile(
                  title: Text(
                    t.settings.debug.row.dummyRecipe.title,
                    style: const TextStyle(fontFamily: FontFamily.notoSansJP),
                  ),
                  onPressed: (_) async {
                    await ref
                        .read(recipeNoteServiceProvider)
                        .createDummyRecipeNote();
                    // ignore: use_build_context_synchronously
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          t.settings.debug.row.dummyRecipe.title,
                        ),
                        duration: const Duration(seconds: 1),
                      ),
                    );
                  },
                ),
                SettingsTile(
                  title: Text(
                    t.settings.debug.row.deleteLocalData.title,
                    style: const TextStyle(fontFamily: FontFamily.notoSansJP),
                  ),
                  onPressed: (_) async {
                    ref.read(databaseProvider).clearAll();
                    await ref.read(preferenceServiceProvider).clearAll();
                    // ignore: use_build_context_synchronously
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          t.settings.debug.row.deleteLocalData.title,
                        ),
                        duration: const Duration(seconds: 1),
                      ),
                    );
                  },
                ),
              ],
            ),
        ],
      ),
    );
  }

  Future<void> _openBrowser({required String url}) async {
    if (kIsWeb) {
      await launchUrl(
        Uri.parse(url),
        mode: LaunchMode.externalApplication,
      );
    } else if (Platform.isMacOS) {
      await InAppBrowser().openUrlRequest(
        urlRequest: URLRequest(
          url: WebUri(url),
        ),
      );
    } else {
      await ChromeSafariBrowser().open(
        url: WebUri(url),
      );
    }
  }
}
