import 'package:buzz_recipe_viewer/provider/fullscreen_video_playing_state_provider.dart';
import 'package:buzz_recipe_viewer/ui/favorite/favorite_page.dart';
import 'package:buzz_recipe_viewer/ui/recipe_note/recipe_note_page.dart';
import 'package:buzz_recipe_viewer/ui/search/search_page.dart';
import 'package:buzz_recipe_viewer/ui/settings/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final currentAppTab = StateProvider((ref) => AppTab.recipe);

enum AppTab {
  recipe('Recipe', Icon(Icons.note)),
  search('Search', Icon(Icons.search)),
  favorite('Favorite', Icon(Icons.favorite)),
  // history('History', Icon(Icons.history)),
  setting('Settings', Icon(Icons.settings));

  const AppTab(this.title, this.icon);
  final String title;
  final Icon icon;

  static AppTab fromIndex(int index) {
    return AppTab.values[index];
  }

  Widget Function() get show => switch (this) {
        AppTab.recipe => RecipeNotePage.show,
        AppTab.search => SearchPage.show,
        AppTab.favorite => FavoritePage.show,
        // AppTab.history => HistoryPage.show,
        AppTab.setting => SettingsPage.show,
      };
}

class NavigationPage extends ConsumerWidget {
  const NavigationPage({super.key});

  static final List<GlobalKey<NavigatorState>> navigatorKeys =
      AppTab.values.map((tab) => GlobalKey<NavigatorState>()).toList();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final currentTab = ref.watch(currentAppTab);
    final fullscreenVideoPlayingState =
        ref.watch(fullscreenVideoPlayingStateProvider);

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
        bottomNavigationBar: fullscreenVideoPlayingState
            ? null
            : NavigationBar(
                destinations: AppTab.values
                    .map(
                      (tab) => NavigationDestination(
                        icon: tab.icon,
                        label: tab.title,
                      ),
                    )
                    .toList(),
                onDestinationSelected: (value) {
                  if (navigatorKeys[currentTab.index].currentState?.canPop() ??
                      false) {
                    navigatorKeys[currentTab.index].currentState?.pop();
                  }
                  ref.read(currentAppTab.notifier).state =
                      AppTab.fromIndex(value);
                },
                selectedIndex: currentTab.index,
                indicatorColor: theme.colorScheme.primaryContainer,
              ),
      ),
    );
  }
}
