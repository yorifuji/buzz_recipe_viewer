import 'package:buzz_recipe_viewer/gen/assets.gen.dart';
import 'package:buzz_recipe_viewer/i18n/strings.g.dart';
import 'package:buzz_recipe_viewer/model/favorite.dart';
import 'package:buzz_recipe_viewer/repository/favorite_repository.dart';
import 'package:buzz_recipe_viewer/service/favorite_service.dart';
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
    final favoriteStream = ref.watch(favoriteStreamProvider);
    final body = favoriteStream.when(
      data: (data) => data.isEmpty
          ? const _EmptyFavoriteContainer()
          : _FavoriteListContainer(data),
      error: (error, stackTrace) => const CircularProgressIndicator(),
      loading: () => const CircularProgressIndicator(),
    );
    return Scaffold(appBar: AppBar(title: Text(t.favorite.title)), body: body);
  }
}

class _EmptyFavoriteContainer extends StatelessWidget {
  const _EmptyFavoriteContainer();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Assets.images.favorite.image(width: 256, height: 256),
          Text(
            t.favorite.empty,
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyMedium,
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
                await launchUrl(
                  url,
                  mode: LaunchMode.externalApplication,
                );
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
