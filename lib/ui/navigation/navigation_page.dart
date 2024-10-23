import 'package:buzz_recipe_viewer/i18n/strings.g.dart';
import 'package:buzz_recipe_viewer/store/locale_notifier.dart';
import 'package:buzz_recipe_viewer/ui/favorite/favorite_page.dart';
import 'package:buzz_recipe_viewer/ui/recipe/recipe_page.dart';
import 'package:buzz_recipe_viewer/ui/settings/settings_page.dart';
import 'package:buzz_recipe_viewer/ui/video/video_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

enum AppTab {
  recipe(Icon(Icons.note)),
  video(Icon(Icons.ondemand_video)),
  favorite(Icon(Icons.favorite)),
  setting(Icon(Icons.settings));

  const AppTab(this.icon);
  factory AppTab.fromIndex(int index) => AppTab.values[index];

  final Icon icon;

  Widget Function() get show => switch (this) {
        AppTab.recipe => RecipePage.show,
        AppTab.video => VideoPage.show,
        AppTab.favorite => FavoritePage.show,
        AppTab.setting => SettingsPage.show,
      };

  String get title => switch (this) {
        recipe => t.tab.recipe,
        video => t.tab.video,
        favorite => t.tab.favorite,
        setting => t.tab.settings,
      };
}

class NavigationPage extends HookConsumerWidget {
  const NavigationPage({super.key});

  static final List<GlobalKey<NavigatorState>> navigatorKeys =
      AppTab.values.map((tab) => GlobalKey<NavigatorState>()).toList();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTab = useState<AppTab>(AppTab.recipe);
    // to update tab titles when locale changes
    ref.watch(
      localeNotiferProvider,
    );

    return PopScope(
      // スタックが存在しない場合はアプリを終了する（バックグラウンドに移動する）
      canPop:
          navigatorKeys[currentTab.value.index].currentState?.canPop() ?? false,
      child: Scaffold(
        body: IndexedStack(
          index: currentTab.value.index,
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
            if (navigatorKeys[currentTab.value.index].currentState?.canPop() ??
                false) {
              navigatorKeys[currentTab.value.index].currentState?.pop();
            }
            currentTab.value = AppTab.fromIndex(value);
          },
          selectedIndex: currentTab.value.index,
        ),
      ),
    );
  }
}
