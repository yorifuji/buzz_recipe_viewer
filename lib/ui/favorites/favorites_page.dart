import 'package:buzz_recipe_viewer/ui/favorites/favorites_page_view_model.dart';
import 'package:buzz_recipe_viewer/ui/search_hit/search_hit_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class FavoritesPage extends HookConsumerWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(favoritesViewModelProvider.notifier);
    final favorites = ref
        .watch(favoritesViewModelProvider.select((value) => value.favorites));
    useEffect(
      () {
        Future.microtask(viewModel.initialLoad);
        return null;
      },
      const [],
    );

    return Scaffold(
      body: SafeArea(
        child: favorites.isEmpty
            ? const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.videogame_asset,
                      size: 32,
                    ),
                    Text(
                      'Love a video?\nLong-press to make it your fave!',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              )
            : SingleChildScrollView(
                child: Column(
                  children: favorites
                      .map(
                        (e) => Dismissible(
                          key: UniqueKey(),
                          child: InkWell(
                            child: SearchHitWidget(searchHit: e.searchHit),
                            onTap: () async {
                              final url = Uri.parse(e.searchHit.url);
                              if (await launchUrl(
                                url,
                                mode: LaunchMode.externalApplication,
                              )) {
                              } else {
                                // FIXME:
                                // ignore: only_throw_errors
                                throw 'Could not launch $url';
                              }
                            },
                          ),
                          onDismissed: (direction) {
                            viewModel.deleteFavorite(e);
                          },
                        ),
                      )
                      .toList(),
                ),
              ),
      ),
    );
  }
}
