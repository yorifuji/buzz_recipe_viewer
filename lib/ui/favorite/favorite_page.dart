import 'dart:async';
import 'dart:io';

import 'package:buzz_recipe_viewer/gen/assets.gen.dart';
import 'package:buzz_recipe_viewer/i18n/strings.g.dart';
import 'package:buzz_recipe_viewer/model/favorite.dart';
import 'package:buzz_recipe_viewer/provider/preference_provider.dart';
import 'package:buzz_recipe_viewer/repository/firestore/favorite_provider.dart';
import 'package:buzz_recipe_viewer/repository/firestore/favorite_repository.dart';
import 'package:buzz_recipe_viewer/ui/common/app_bar.dart';
import 'package:buzz_recipe_viewer/ui/common/search_hit/video_image_container.dart';
import 'package:buzz_recipe_viewer/ui/common/search_hit/video_information_container.dart';
import 'package:buzz_recipe_viewer/ui/favorite/favorite_notifier.dart';
import 'package:buzz_recipe_viewer/ui/video_player/video_player_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class FavoritePage extends ConsumerWidget {
  const FavoritePage({super.key});

  static Widget show() => const FavoritePage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteStream = ref.watch(favoriteStreamProvider);
    return Scaffold(
      appBar: buildAppBar(context, title: t.favorite.title),
      body: RefreshIndicator(
        displacement: 0,
        strokeWidth: 2,
        child: favoriteStream.when(
          skipLoadingOnRefresh: true,
          loading: () => const Center(
            child: CircularProgressIndicator(strokeWidth: 2),
          ),
          data: (data) => _FavoriteListWidget(
            favorites: data,
            isReloading: favoriteStream.isReloading,
          ),
          error: (_, __) => const _ErrorWidget(),
        ),
        onRefresh: () async {
          ref.read(favoriteWindowNotifierProvider.notifier).resetWindow();
          ref.invalidate(favoriteStreamProvider);
          unawaited(HapticFeedback.mediumImpact());
        },
      ),
    );
  }
}

class _FavoriteListWidget extends ConsumerWidget {
  const _FavoriteListWidget({
    required this.favorites,
    required this.isReloading,
  });

  final List<Favorite> favorites;
  final bool isReloading;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final windowSize = ref.watch(favoriteWindowNotifierProvider);
    final hasReachedEnd = favorites.length <= windowSize;
    final takeFavorites = favorites.take(windowSize).toList();
    if (takeFavorites.isEmpty) {
      return const _NoFavoritesWidget();
    } else {
      return ListView.builder(
        itemCount:
            hasReachedEnd ? takeFavorites.length : takeFavorites.length + 1,
        itemBuilder: (_, index) {
          final valuleKey = ValueKey(index);
          if (hasReachedEnd) {
            return _FavoriteCardWidget(
              key: valuleKey,
              favorite: takeFavorites[index],
            );
          } else {
            if (index == takeFavorites.length) {
              return Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 16),
                child: TextButton(
                  onPressed: () {
                    ref
                        .read(favoriteWindowNotifierProvider.notifier)
                        .growWindow();
                  },
                  child: Text(t.common.more),
                ),
              );
            } else {
              return _FavoriteCardWidget(
                key: valuleKey,
                favorite: takeFavorites[index],
              );
            }
          }
        },
      );
    }
  }
}

class _FavoriteCardWidget extends ConsumerWidget {
  const _FavoriteCardWidget({
    required this.favorite,
    super.key,
  });

  final Favorite favorite;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isInternalPlayerAvailable = !kIsWeb && !Platform.isMacOS;
    final useInternalPlayer = isInternalPlayerAvailable &&
        ref.watch(boolPreferenceProvider(Preference.useInternalPlayer));

    return Dismissible(
      key: ValueKey(favorite),
      child: Column(
        children: [
          VideoImageContainer(
            searchHit: favorite.searchHit,
            onTap: () async {
              if (useInternalPlayer) {
                await Navigator.push(
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
        await ref.read(favoriteRepositoryProvider).delete(favorite);
      },
    );
  }
}

class _NoFavoritesWidget extends StatelessWidget {
  const _NoFavoritesWidget();

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

class _ErrorWidget extends ConsumerWidget {
  const _ErrorWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Assets.images.error.image(width: 256, height: 256),
          TextButton(
            onPressed: () => ref.invalidate(favoriteStreamProvider),
            child: Text(t.common.fetchFailed),
          ),
        ],
      ),
    );
  }
}
