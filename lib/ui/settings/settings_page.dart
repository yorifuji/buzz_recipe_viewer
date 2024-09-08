import 'dart:io' show Platform;

import 'package:buzz_recipe_viewer/gen/fonts.gen.dart';
import 'package:buzz_recipe_viewer/i18n/strings.g.dart';
import 'package:buzz_recipe_viewer/provider/flavor_provider.dart';
import 'package:buzz_recipe_viewer/provider/package_info_provider.dart';
import 'package:buzz_recipe_viewer/repository/preference_repository.dart';
import 'package:buzz_recipe_viewer/ui/common/app_bar.dart';
import 'package:buzz_recipe_viewer/ui/settings/color/color_setting_page.dart';
import 'package:buzz_recipe_viewer/ui/settings/common/custom_settings_list.dart';
import 'package:buzz_recipe_viewer/ui/settings/debug/debug_page.dart';
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
      appBar: buildAppBar(context, title: t.settings.title),
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
              if (!kIsWeb && (Platform.isIOS || Platform.isAndroid))
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
                SettingsTile.navigation(
                  title: Text(
                    t.settings.debug.header,
                    style: const TextStyle(fontFamily: FontFamily.notoSansJP),
                  ),
                  onPressed: (context) async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) {
                          return const DebugPage();
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          SettingsSection(
            title: Text(
              t.settings.account.title,
              style: const TextStyle(fontFamily: FontFamily.notoSansJP),
            ),
            tiles: [
              SettingsTile(
                title: Text(
                  t.settings.account.delete.title,
                  style: const TextStyle(fontFamily: FontFamily.notoSansJP),
                ),
                onPressed: (context) {
                  showDialog<void>(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text(
                        t.settings.account.delete.title,
                        style: const TextStyle(
                          fontFamily: FontFamily.notoSansJP,
                        ),
                      ),
                      content: Text(
                        t.settings.account.delete.description,
                        style: const TextStyle(
                          fontFamily: FontFamily.notoSansJP,
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text(
                            t.common.cancel,
                            style: const TextStyle(
                              fontFamily: FontFamily.notoSansJP,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            // delete account
                            Navigator.pop(context);
                          },
                          child: Text(
                            t.common.ok,
                            style: const TextStyle(
                              fontFamily: FontFamily.notoSansJP,
                            ),
                          ),
                        ),
                      ],
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
