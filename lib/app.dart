import 'dart:async';

import 'package:buzz_recipe_viewer/data/provider/app_lifecycle_state_provider.dart';
import 'package:buzz_recipe_viewer/data/provider/theme_data_provider.dart';
import 'package:buzz_recipe_viewer/data/service/notification_service.dart';
import 'package:buzz_recipe_viewer/data/store/locale_notifier.dart';
import 'package:buzz_recipe_viewer/data/store/theme_notifier.dart';
import 'package:buzz_recipe_viewer/domain/model/locale_preference.dart';
import 'package:buzz_recipe_viewer/i18n/strings.g.dart';
import 'package:buzz_recipe_viewer/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    final locale = ref.watch(localeNotiferProvider).maybeWhen(
          skipLoadingOnReload: true,
          data: (data) => data.toLocale,
          orElse: () => LocalePreference.system.toLocale,
        );

    ref
      ..listen(
        appLifecycleNotifierProvider,
        (_, state) {
          if (state.isResumed) {
            ref.invalidate(notificationAuthorizeStatusProvider);
          }
        },
      )
      ..listen(
        localeNotiferProvider,
        (previous, current) {
          if (previous != current) {
            Future.microtask(() {
              unawaited(
                WidgetsFlutterBinding.ensureInitialized().performReassemble(),
              );
            });
          }
        },
      );

    return TranslationProvider(
      child: MaterialApp.router(
        // debugShowCheckedModeBanner: false,
        title: 't.app.title',
        theme: ref.watch(themeDataProvider()),
        darkTheme: ref.watch(themeDataProvider(isDarkMode: true)),
        themeMode: ref.watch(themeNotiferProvider).themeMode,
        locale: locale,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: LocalePreference.supportedLocaleList(),
        routerConfig: router,
      ),
    );
  }
}
