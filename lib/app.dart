import 'package:buzz_recipe_viewer/i18n/strings.g.dart';
import 'package:buzz_recipe_viewer/model/locale_preference.dart';
import 'package:buzz_recipe_viewer/provider/app_lifecycle_state_provider.dart';
import 'package:buzz_recipe_viewer/provider/theme_data_provider.dart';
import 'package:buzz_recipe_viewer/router/router.dart';
import 'package:buzz_recipe_viewer/service/notification_service.dart';
import 'package:buzz_recipe_viewer/store/locale_notifier.dart';
import 'package:buzz_recipe_viewer/store/theme_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    ref.listen<bool>(
      appLifecycleStateProvider.select((state) => state.isResumed),
      (_, resumed) {
        if (resumed) {
          ref.invalidate(notificationAuthorizeStatusProvider);
        }
      },
    );

    return TranslationProvider(
      child: MaterialApp.router(
        // debugShowCheckedModeBanner: false,
        title: t.app.title,
        theme: ref.watch(themeDataProvider()),
        darkTheme: ref.watch(themeDataProvider(isDarkMode: true)),
        themeMode: ref.watch(themeNotiferProvider).themeMode,
        locale: ref.watch(localeNotiferProvider).toLocale,
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
