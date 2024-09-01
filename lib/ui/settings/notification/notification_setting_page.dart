import 'package:buzz_recipe_viewer/gen/fonts.gen.dart';
import 'package:buzz_recipe_viewer/i18n/strings.g.dart';
import 'package:buzz_recipe_viewer/service/notification_service.dart';
import 'package:buzz_recipe_viewer/ui/settings/common/custom_settings_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:settings_ui/settings_ui.dart';

class NotificationSettingPage extends StatelessWidget {
  const NotificationSettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(t.settings.general.notifications.title),
      ),
      body: CustomSettingsList(
        sections: [
          SettingsSection(
            title: Text(
              t.settings.general.notifications.notifications.title,
              style: const TextStyle(fontFamily: FontFamily.notoSansJP),
            ),
            tiles: [
              SettingsTile(
                title: InkWell(
                  child: Text(
                    t.settings.general.notifications.notifications
                        .allowNotifications.title,
                    style: const TextStyle(fontFamily: FontFamily.notoSansJP),
                  ),
                  onTap: () async {
                    // Request permission
                    final authorizationStatus =
                        await NotificationService.requestPermission();
                    // ignore: use_build_context_synchronously
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Permission: $authorizationStatus'),
                        duration: const Duration(seconds: 1),
                      ),
                    );
                  },
                ),
              ),
              SettingsTile(
                title: InkWell(
                  child: Text(
                    t.settings.general.notifications.notifications.copyFcmToken
                        .title,
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
        ],
      ),
    );
  }
}
