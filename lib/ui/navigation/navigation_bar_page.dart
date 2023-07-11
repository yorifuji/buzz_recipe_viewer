import 'package:buzz_recipe_viewer/ui/favorites/favorites_page.dart';
import 'package:buzz_recipe_viewer/ui/histories/histories_page.dart';
import 'package:buzz_recipe_viewer/ui/search/search_page.dart';
import 'package:buzz_recipe_viewer/ui/settings/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final currentAppTab = StateProvider((ref) => AppTab.search);

enum AppTab {
  search('Search', Icon(Icons.search)),
  favorite('Favorite', Icon(Icons.favorite)),
  history('History', Icon(Icons.history)),
  setting('Settings', Icon(Icons.settings));

  const AppTab(this.title, this.icon);
  final String title;
  final Icon icon;

  static AppTab fromIndex(int index) {
    return AppTab.values[index];
  }

  Widget Function() get show => switch (this) {
        AppTab.search => SearchPage.show,
        AppTab.favorite => FavoritesPage.show,
        AppTab.history => HistoriesPage.show,
        AppTab.setting => SettingsPage.show,
      };
}

class NavigationBarPage extends ConsumerWidget {
  const NavigationBarPage({super.key});

  static final List<GlobalKey<NavigatorState>> navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final currentTab = ref.watch(currentAppTab);
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return WillPopScope(
      // スタックが存在しない場合はアプリを終了する（バックグラウンドに移動する）
      onWillPop: () async =>
          !(await navigatorKeys[currentTab.index].currentState?.maybePop() ??
              true),
      child: Scaffold(
        body: IndexedStack(
          index: currentTab.index,
          children: AppTab.values
              .map(
                (tab) => Navigator(
                  key: navigatorKeys[tab.index],
                  onGenerateRoute: (_) => MaterialPageRoute(
                    builder: (_) => tab.show(),
                  ),
                ),
              )
              .toList(),
        ),
        bottomNavigationBar: isPortrait
            ? NavigationBar(
                destinations: AppTab.values
                    .map(
                      (tab) => NavigationDestination(
                        icon: tab.icon,
                        label: tab.title,
                      ),
                    )
                    .toList(),
                onDestinationSelected: (value) {
                  if (navigatorKeys[value].currentState?.canPop() ?? false) {
                    navigatorKeys[value].currentState?.pop();
                  }
                  ref.read(currentAppTab.notifier).state =
                      AppTab.fromIndex(value);
                },
                selectedIndex: currentTab.index,
                indicatorColor: theme.colorScheme.primaryContainer,
              )
            : null,
      ),
    );
  }
}
