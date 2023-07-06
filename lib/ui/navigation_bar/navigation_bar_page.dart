import 'package:buzz_recipe_viewer/ui/favorites/favorites_page.dart';
import 'package:buzz_recipe_viewer/ui/histories/histories_page.dart';
import 'package:buzz_recipe_viewer/ui/search/search_page.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final currentAppTab = StateProvider((ref) => AppTab.search);

enum AppTab {
  search('Search', Icon(Icons.search)),
  favorites('Favorite', Icon(Icons.favorite)),
  histories('History', Icon(Icons.history));

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

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final currentTab = ref.watch(currentAppTab);
    return Scaffold(
      body: IndexedStack(
        index: currentTab.index,
        children: AppTab.values.map((tab) {
          switch (tab) {
            case AppTab.search:
              return SearchPage.show();
            case AppTab.favorites:
              return const FavoritesPage();
            case AppTab.histories:
              return const HistoriesPage();
          }
        }).toList(),
      ),
      bottomNavigationBar: NavigationBar(
        destinations: AppTab.values
            .map(
              (tab) => NavigationDestination(
                icon: tab.icon,
                label: tab.title,
              ),
            )
            .toList(),
        onDestinationSelected: (value) {
          ref.read(currentAppTab.notifier).state = AppTab.fromIndex(value);
        },
        selectedIndex: currentTab.index,
        indicatorColor: theme.colorScheme.primaryContainer,
      ),
    );
  }
}
