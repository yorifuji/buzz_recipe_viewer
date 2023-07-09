import 'package:buzz_recipe_viewer/ui/favorites/favorites_page.dart';
import 'package:buzz_recipe_viewer/ui/histories/histories_page.dart';
import 'package:buzz_recipe_viewer/ui/search/search_page.dart';
import 'package:buzz_recipe_viewer/ui/settings/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final currentAppTab = StateProvider((ref) => AppTab.search);

enum AppTab {
  search('Search', Icon(Icons.search)),
  favorites('Favorite', Icon(Icons.favorite)),
  histories('History', Icon(Icons.history)),
  settings('Settings', Icon(Icons.settings));

  const AppTab(this.title, this.icon);
  final String title;
  final Icon icon;

  // indexからAppTabを取得する
  static AppTab fromIndex(int index) {
    return AppTab.values[index];
  }
}

class NavigationBarPage extends ConsumerWidget {
  const NavigationBarPage({super.key});

  static final searchPageNavigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final currentTab = ref.watch(currentAppTab);
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return WillPopScope(
      // 検索画面でスタックが存在する場合は検索画面に戻るが他の画面ではアプリを終了する（バックグラウンドに移動する）
      onWillPop: () async =>
          !(await searchPageNavigatorKey.currentState?.maybePop() ?? true),
      child: Scaffold(
        body: IndexedStack(
          index: currentTab.index,
          children: AppTab.values.map((tab) {
            switch (tab) {
              case AppTab.search:
                return Navigator(
                  key: searchPageNavigatorKey,
                  onGenerateRoute: (_) =>
                      MaterialPageRoute(builder: (_) => SearchPage.show()),
                );
              case AppTab.favorites:
                return const FavoritesPage();
              case AppTab.histories:
                return const HistoriesPage();
              case AppTab.settings:
                return const SettingsPage();
            }
          }).toList(),
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
                  if (AppTab.fromIndex(value) == AppTab.search &&
                      (searchPageNavigatorKey.currentState?.canPop() ??
                          false)) {
                    searchPageNavigatorKey.currentState?.pop();
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
