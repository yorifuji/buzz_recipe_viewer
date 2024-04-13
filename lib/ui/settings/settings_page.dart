import 'dart:io' show Platform;
import 'package:buzz_recipe_viewer/i18n/strings.g.dart';
import 'package:buzz_recipe_viewer/provider/package_info_provider.dart';
import 'package:buzz_recipe_viewer/repository/shared_preferences_repository.dart';
import 'package:buzz_recipe_viewer/service/recipe_note_service.dart';
import 'package:buzz_recipe_viewer/ui/settings/color/color_setting_page.dart';
import 'package:buzz_recipe_viewer/ui/settings/common/custom_settings_list.dart';
import 'package:buzz_recipe_viewer/ui/settings/locale/locale_setting_page.dart';
import 'package:buzz_recipe_viewer/ui/settings/settings_view_model.dart';
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
    final useInternalPlayer = ref.watch(
      settingsViewModelProvider.select((value) => value.useInternalPlayer),
    );
    final viewModel = ref.watch(settingsViewModelProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text(t.settings.title),
      ),
      body: CustomSettingsList(
        sections: [
          SettingsSection(
            title: Text(t.settings.general.header),
            tiles: [
              SettingsTile.navigation(
                title: Text(t.settings.general.row.theme.title),
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
                title: Text(t.settings.general.row.color.title),
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
                title: Text(t.settings.general.row.language.title),
                onPressed: (context) {
                  Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) {
                        return const LocaleSettingPage();
                      },
                    ),
                  );
                },
              ),
            ],
          ),
          SettingsSection(
            title: Text(t.settings.video.header),
            tiles: [
              SettingsTile.switchTile(
                title: Text(t.settings.video.row.playWithinApp.title),
                initialValue: useInternalPlayer,
                // web or macos
                description: kIsWeb || Platform.isMacOS
                    ? Text(t.settings.video.row.playWithinApp.description)
                    : null,
                enabled: !kIsWeb,
                onToggle: (value) =>
                    viewModel.setUseInternalPlayer(useInternalPlayer: value),
              ),
            ],
          ),
          SettingsSection(
            title: Text(t.settings.support.header),
            tiles: [
              SettingsTile.navigation(
                title: Text(t.settings.support.row.help.title),
                onPressed: (context) =>
                    _openBrowser(url: 'https://flutter.dev/'),
              ),
              SettingsTile.navigation(
                title: Text(t.settings.support.row.contact.title),
                onPressed: (context) =>
                    _openBrowser(url: 'https://flutter.dev/'),
              ),
              SettingsTile.navigation(
                title: Text(t.settings.support.row.feedback.title),
                onPressed: (context) =>
                    _openBrowser(url: 'https://flutter.dev/'),
              ),
              if (!kIsWeb)
                SettingsTile(
                  title: Text(t.settings.support.row.review.title),
                  onPressed: (context) async {
                    final inAppReview = InAppReview.instance;
                    if (await inAppReview.isAvailable()) {
                      await inAppReview.requestReview();
                    }
                  },
                ),
              SettingsTile(
                title: Text(t.settings.support.row.share.title),
                onPressed: (context) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Not implemented')),
                  );
                },
              ),
            ],
          ),
          SettingsSection(
            title: Text(t.settings.about.header),
            tiles: [
              SettingsTile.navigation(
                title: Text(t.settings.about.row.terms.title),
                onPressed: (context) =>
                    _openBrowser(url: 'https://flutter.dev/'),
              ),
              SettingsTile.navigation(
                title: Text(t.settings.about.row.privacy.title),
                onPressed: (context) =>
                    _openBrowser(url: 'https://flutter.dev/'),
              ),
              SettingsTile.navigation(
                title: Text(t.settings.about.row.license.title),
                onPressed: (context) => showLicensePage(context: context),
              ),
              SettingsTile(
                title: Text(t.settings.about.row.version.title),
                value:
                    Text('${packageInfo.version}(${packageInfo.buildNumber})'),
              ),
            ],
          ),
          if (kDebugMode)
            SettingsSection(
              title: Text(t.settings.debug.header),
              tiles: [
                SettingsTile(
                  title: Text(t.settings.debug.row.dummyRecipe.title),
                  onPressed: (_) async {
                    await ref
                        .read(recipeNoteServiceProvider)
                        .createDummyRecipeNote();
                    // ignore: use_build_context_synchronously
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Add dummy recipe',
                          style: TextStyle(fontSize: 12),
                        ),
                        duration: Duration(seconds: 1),
                      ),
                    );
                  },
                ),
                SettingsTile(
                  title: const Text('Clear Shared Preference'),
                  onPressed: (_) async {
                    await ref.read(sharedPreferencesRepositoryProvider).clear();
                    ref.invalidate(sharedPreferencesRepositoryProvider);
                    // ignore: use_build_context_synchronously
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Clear Shared Preference',
                          style: TextStyle(fontSize: 12),
                        ),
                        duration: Duration(seconds: 1),
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
