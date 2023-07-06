import 'package:buzz_recipe_viewer/ui/favorites/favorites_page_view_model.dart';
import 'package:buzz_recipe_viewer/ui/search_hit/search_hit_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
        child: SingleChildScrollView(
          child: Column(
            children: favorites
                .map(
                  (e) => Dismissible(
                    key: UniqueKey(),
                    child: SearchHitWidget(searchHit: e.searchHit),
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
