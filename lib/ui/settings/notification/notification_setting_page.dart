import 'package:app_settings/app_settings.dart';
import 'package:buzz_recipe_viewer/gen/fonts.gen.dart';
import 'package:buzz_recipe_viewer/i18n/strings.g.dart';
import 'package:buzz_recipe_viewer/service/notification_service.dart';
import 'package:buzz_recipe_viewer/ui/settings/common/custom_settings_list.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:settings_ui/settings_ui.dart';

class NotificationSettingPage extends HookConsumerWidget {
  const NotificationSettingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final subscribeGeneral = useState<bool>(true);
    final subscribeVideo = useState<bool>(true);
    final authorizationStatus = ref.watch(notificationAuthorizeStatusProvider);

    final allowNotificationTile = switch (authorizationStatus) {
      AsyncData(:final value) => switch (value) {
          AuthorizationStatus.denied => SettingsTile.switchTile(
              initialValue: false,
              title: Text(
                t.settings.general.notifications.page.settings.items[0],
                style: const TextStyle(fontFamily: FontFamily.notoSansJP),
              ),
              onToggle: (bool value) async {
                await AppSettings.openAppSettings(
                  type: AppSettingsType.notification,
                );
                // TODO: invalidate notificationAuthorizeStatusProvider when the user returns from the settings
              },
            ),
          _ => SettingsTile.switchTile(
              initialValue: value == AuthorizationStatus.authorized,
              title: Text(
                t.settings.general.notifications.page.settings.items[0],
                style: const TextStyle(fontFamily: FontFamily.notoSansJP),
              ),
              onToggle: value != AuthorizationStatus.authorized
                  ? (value) async {
                      // Request permission
                      await NotificationService.requestPermission();
                      ref.invalidate(notificationAuthorizeStatusProvider);
                    }
                  : null,
            ),
        },
      _ => SettingsTile.switchTile(
          title: Text(
            t.settings.general.notifications.page.settings.items[0],
            style: const TextStyle(fontFamily: FontFamily.notoSansJP),
          ),
          initialValue: false,
          onToggle: null,
          enabled: false,
        )
    };

    return Scaffold(
      appBar: AppBar(
        title: Text(t.settings.general.notifications.page.title),
      ),
      body: CustomSettingsList(
        sections: [
          SettingsSection(
            title: Text(
              t.settings.general.notifications.page.settings.title,
              style: const TextStyle(fontFamily: FontFamily.notoSansJP),
            ),
            tiles: [
              allowNotificationTile,
              SettingsTile(
                title: InkWell(
                  child: Text(
                    t.settings.general.notifications.page.settings.items[1],
                    style: const TextStyle(fontFamily: FontFamily.notoSansJP),
                  ),
                  onTap: () async {
                    // Get the token each time the application loads
                    final token = await NotificationService.getFcmToken();
                    if (token != null) {
                      // ignore: use_build_context_synchronously
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('FCM Token: $token'),
                          duration: const Duration(seconds: 1),
                        ),
                      );
                      await Clipboard.setData(ClipboardData(text: token));
                    }
                  },
                ),
              ),
            ],
          ),
          SettingsSection(
            title: Text(
              t.settings.general.notifications.page.topic.title,
              style: const TextStyle(fontFamily: FontFamily.notoSansJP),
            ),
            tiles: [
              SettingsTile.switchTile(
                title: Text(
                  t.settings.general.notifications.page.topic.items[0],
                  style: const TextStyle(fontFamily: FontFamily.notoSansJP),
                ),
                initialValue: subscribeGeneral.value,
                onToggle: (bool value) {
                  subscribeGeneral.value = value;
                  if (value) {
                    NotificationService.subscribeToTopic(
                      NotificationTopic.general.value,
                    );
                  } else {
                    NotificationService.unsubscribeFromTopic(
                      NotificationTopic.general.value,
                    );
                  }
                },
              ),
              SettingsTile.switchTile(
                title: Text(
                  t.settings.general.notifications.page.topic.items[1],
                  style: const TextStyle(fontFamily: FontFamily.notoSansJP),
                ),
                initialValue: subscribeVideo.value,
                onToggle: (bool value) {
                  subscribeVideo.value = value;
                  if (value) {
                    NotificationService.subscribeToTopic(
                      NotificationTopic.video.value,
                    );
                  } else {
                    NotificationService.unsubscribeFromTopic(
                      NotificationTopic.video.value,
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
