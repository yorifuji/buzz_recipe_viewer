import 'package:buzz_recipe_viewer/provider/theme_selector_provider.dart';
import 'package:buzz_recipe_viewer/ui/navigation/navigation_page.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeSelectorProvider);
    final themeSelector = ref.read(themeSelectorProvider.notifier);
    return MaterialApp(
      title: 'レシピ検索',
      theme: themeSelector.lightTheme(),
      darkTheme: themeSelector.darkTheme(),
      themeMode: theme,
      home: const NavigationPage(),
      // debugShowCheckedModeBanner: false,
    );
  }
}
