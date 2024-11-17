import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notification_service.g.dart';

enum NotificationTopic {
  general('general'),
  video('video'),
  ;

  const NotificationTopic(this.value);

  final String value;
}

@riverpod
Future<AuthorizationStatus> notificationAuthorizeStatus(
  Ref ref,
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
      await subscribeToAllTopic();
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

  static Future<void> subscribeToTopic(String topic) {
    return FirebaseMessaging.instance.subscribeToTopic(topic);
  }

  static Future<void> unsubscribeFromTopic(String topic) {
    return FirebaseMessaging.instance.unsubscribeFromTopic(topic);
  }

  static Future<void> subscribeToAllTopic() async {
    await (
      FirebaseMessaging.instance
          .subscribeToTopic(NotificationTopic.general.value),
      FirebaseMessaging.instance.subscribeToTopic(NotificationTopic.video.value)
    ).wait;
  }

  // delete token
  static Future<void> deleteToken() {
    return FirebaseMessaging.instance.deleteToken();
  }
}
