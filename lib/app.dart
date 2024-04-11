import 'package:buzz_recipe_viewer/i18n/strings.g.dart';
import 'package:buzz_recipe_viewer/model/locale_preference.dart';
import 'package:buzz_recipe_viewer/provider/locale_preference_provider.dart';
import 'package:buzz_recipe_viewer/provider/theme_data_provider.dart';
import 'package:buzz_recipe_viewer/provider/theme_mode_preference_provider.dart';
import 'package:buzz_recipe_viewer/ui/navigation/navigation_page.dart';
import 'package:buzz_recipe_viewer/ui/walkthrough/walkthrough_page.dart';
import 'package:buzz_recipe_viewer/ui/walkthrough/walkthrough_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isShouldShowWalkthrough = ref.watch(
      walkthroughViewModelProvider
          .select((value) => value.isShouldShowWalkthrough),
    );

    return TranslationProvider(
      child: MaterialApp(
        // debugShowCheckedModeBanner: false,
        title: t.appTitle,
        theme: ref.watch(themeDataProvider()),
        darkTheme: ref.watch(themeDataProvider(isDarkMode: true)),
        themeMode: ref.watch(themeModePreferenceProvider),
        locale: ref.watch(localePreferenceProvider),
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: LocalePreference.supportedLocaleList(),
        home: isShouldShowWalkthrough
            ? const WalkthroughPage()
            : const NavigationPage(),
      ),
    );
  }
}
