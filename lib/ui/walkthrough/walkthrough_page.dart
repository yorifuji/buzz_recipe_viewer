import 'package:app_settings/app_settings.dart';
import 'package:buzz_recipe_viewer/gen/assets.gen.dart';
import 'package:buzz_recipe_viewer/i18n/strings.g.dart';
import 'package:buzz_recipe_viewer/provider/preference_provider.dart';
import 'package:buzz_recipe_viewer/service/notification_service.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:introduction_screen/introduction_screen.dart';

class WalkthroughPage extends ConsumerWidget {
  const WalkthroughPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notificationAuthorizeStatus =
        ref.watch(notificationAuthorizeStatusProvider);

    return Scaffold(
      body: SafeArea(
        child: IntroductionScreen(
          pages: [
            PageViewModel(
              title: t.walkthrough.intro1.title,
              body: t.walkthrough.intro1.body,
              image: Padding(
                padding: const EdgeInsets.only(top: 32),
                child: Assets.images.intro1.image(),
              ),
            ),
            PageViewModel(
              title: t.walkthrough.intro2.title,
              body: t.walkthrough.intro2.body,
              image: Padding(
                padding: const EdgeInsets.only(top: 32),
                child: Assets.images.intro2.image(),
              ),
            ),
            PageViewModel(
              title: t.walkthrough.intro3.title,
              bodyWidget: Column(
                children: [
                  Text(t.walkthrough.intro3.body),
                  const SizedBox(height: 16),
                  switch (notificationAuthorizeStatus) {
                    AsyncData(:final value) => switch (value) {
                        AuthorizationStatus.denied => ElevatedButton(
                            onPressed: () async {
                              await AppSettings.openAppSettings(
                                type: AppSettingsType.notification,
                              );
                            },
                            child: Text(
                              t.walkthrough.intro3.openNotificationSettings,
                            ),
                          ),
                        AuthorizationStatus.notDetermined => ElevatedButton(
                            onPressed: () async {
                              await NotificationService.requestPermission();
                              ref.invalidate(
                                notificationAuthorizeStatusProvider,
                              );
                            },
                            child: Text(t.walkthrough.intro3.requestPermission),
                          ),
                        _ => const SizedBox.shrink(),
                      },
                    _ => const Center(
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                  },
                ],
              ),
              decoration: const PageDecoration(bodyAlignment: Alignment.center),
            ),
          ],
          showSkipButton: true,
          showNextButton: false,
          skip: Text(t.walkthrough.skip),
          done: Text(t.walkthrough.done),
          onDone: () async {
            await ref
                .read(
                  boolPreferenceProvider(Preference.shouldShowWalkthrough)
                      .notifier,
                )
                .update(false);
          },
        ),
      ),
    );
  }
}
