import 'package:buzz_recipe_viewer/i18n/strings.g.dart';
import 'package:buzz_recipe_viewer/model/isar/favorite.dart';
import 'package:buzz_recipe_viewer/model/isar/history.dart';
import 'package:buzz_recipe_viewer/service/favorite_service.dart';
import 'package:buzz_recipe_viewer/service/history_service.dart';
import 'package:buzz_recipe_viewer/store/favorite_store.dart';
import 'package:buzz_recipe_viewer/ui/common/search_hit/video_image_container.dart';
import 'package:buzz_recipe_viewer/ui/common/search_hit/video_information_container.dart';
import 'package:buzz_recipe_viewer/ui/settings/settings_view_model.dart';
import 'package:buzz_recipe_viewer/ui/video_player/video_player_page.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class FavoritePage extends ConsumerWidget {
  const FavoritePage({super.key});

  static Widget show() => const FavoritePage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favorites = ref.watch(favoriteStoreProvider);

    return Scaffold(
      appBar: AppBar(title: Text(t.favorite.title)),
      body: favorites.isEmpty
          ? const _EmptyFavoriteContainer()
          : _FavoriteListContainer(favorites),
    );
  }
}

class _EmptyFavoriteContainer extends StatelessWidget {
  const _EmptyFavoriteContainer();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.videogame_asset,
            size: 32,
          ),
          Text(
            t.favorite.empty,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}

class _FavoriteListContainer extends StatelessWidget {
  const _FavoriteListContainer(this.favoriteList);

  final List<Favorite> favoriteList;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: favoriteList.map(_FavoriteContainer.new).toList(),
        ),
      ),
    );
  }
}

class _FavoriteContainer extends ConsumerWidget {
  const _FavoriteContainer(this.favorite);

  final Favorite favorite;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final useInternalPlayer = ref.watch(
      settingsViewModelProvider.select((value) => value.useInternalPlayer),
    );

    return Dismissible(
      key: UniqueKey(),
      child: Column(
        children: [
          VideoImageContainer(
            searchHit: favorite.searchHit,
            onTap: () async {
              await ref.read(historyServiceProvider).add(
                    History.from(favorite.searchHit),
                  );
              if (useInternalPlayer) {
                await Navigator.push(
                  // ignore: use_build_context_synchronously
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) {
                      return VideoPlayerPage(
                        searchHit: favorite.searchHit,
                      );
                    },
                  ),
                );
              } else {
                final url = Uri.parse(favorite.searchHit.url);
                if (await launchUrl(
                  url,
                  mode: LaunchMode.externalApplication,
                )) {
                } else {
                  // FIXME:
                  // ignore: only_throw_errors
                  throw 'Could not launch $url';
                }
              }
            },
          ),
          VideoInformationContainer(searchHit: favorite.searchHit),
        ],
      ),
      onDismissed: (_) async {
        await ref.read(favoriteServiceProvider).delete(favorite);
      },
    );
  }
}
