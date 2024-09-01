import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notification_service.g.dart';

@riverpod
Future<AuthorizationStatus> notificationAuthorizeStatus(
  NotificationAuthorizeStatusRef ref,
) =>
    NotificationService.getAuthorizationStatus();

class NotificationService {
  static Future<AuthorizationStatus> requestPermission() async {
    final result = await FirebaseMessaging.instance.requestPermission();
    if (result.authorizationStatus == AuthorizationStatus.authorized) {
      await FirebaseMessaging.instance
          .setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true,
      );
    }
    return result.authorizationStatus;
  }

  static Future<String?> getFcmToken() {
    return FirebaseMessaging.instance.getToken();
  }

  // get authorization status
  static Future<AuthorizationStatus> getAuthorizationStatus() async {
    return (await FirebaseMessaging.instance.getNotificationSettings())
        .authorizationStatus;
  }
}
