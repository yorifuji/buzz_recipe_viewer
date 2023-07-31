import 'package:buzz_recipe_viewer/model/locale_preference.dart';
import 'package:buzz_recipe_viewer/provider/locale_preference_provider.dart';
import 'package:buzz_recipe_viewer/provider/theme_mode_preference_provider.dart';
import 'package:buzz_recipe_viewer/ui/common/app_theme.dart';
import 'package:buzz_recipe_viewer/ui/navigation/navigation_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      // debugShowCheckedModeBanner: false,
      title: 'レシピ検索',
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: ref.watch(themeModePreferenceProvider),
      locale: ref.watch(localePreferenceProvider),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: LocalePreference.supportedLocaleList(),
      home: const NavigationPage(),
    );
  }
}
