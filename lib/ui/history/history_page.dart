import 'package:buzz_recipe_viewer/model/isar/favorite.dart';
import 'package:buzz_recipe_viewer/model/isar/history.dart';
import 'package:buzz_recipe_viewer/service/favorite_service.dart';
import 'package:buzz_recipe_viewer/service/history_service.dart';
import 'package:buzz_recipe_viewer/store/history_store.dart';
import 'package:buzz_recipe_viewer/ui/common/search_hit/search_hit_container.dart';
import 'package:buzz_recipe_viewer/ui/settings/settings_view_model.dart';
import 'package:buzz_recipe_viewer/ui/video_player/video_player_page.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class HistoryPage extends ConsumerWidget {
  const HistoryPage({super.key});

  static Widget show() => const HistoryPage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final histories = ref.watch(historyStoreProvider);
    final body = histories.isEmpty
        ? const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.smart_toy,
                  size: 32,
                ),
                Text(
                  'Oops!\nNo Traces',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          )
        : SingleChildScrollView(
            child: Column(
              children: histories.map(_HistoryContainer.new).toList(),
            ),
          );
    return Scaffold(body: SafeArea(child: body));
  }
}

class _HistoryContainer extends ConsumerWidget {
  const _HistoryContainer(this.history);

  final History history;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final useInternalPlayer = ref.watch(
      settingsViewModelProvider.select((value) => value.useInternalPlayer),
    );
    return Dismissible(
      key: UniqueKey(),
      child: InkWell(
        child: SearchHitWidget(searchHit: history.searchHit),
        onTap: () async {
          if (useInternalPlayer) {
            await Navigator.push(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) {
                  return VideoPlayerPage(
                    searchHit: history.searchHit,
                  );
                },
              ),
            );
          } else {
            final url = Uri.parse(history.searchHit.url);
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
        onLongPress: () async {
          await ref
              .read(favoriteServiceProvider)
              .add(Favorite.from(history.searchHit));
          // ignore: use_build_context_synchronously
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'お気に入りに追加しました',
                style: TextStyle(fontSize: 12),
              ),
              duration: Duration(seconds: 1),
            ),
          );
        },
      ),
      onDismissed: (direction) {
        ref.read(historyServiceProvider).delete(history);
      },
    );
  }
}
