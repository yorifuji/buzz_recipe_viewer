import 'package:buzz_recipe_viewer/ui/common/search_hit/search_hit_container.dart';
import 'package:buzz_recipe_viewer/ui/history/history_page_view_model.dart';
import 'package:buzz_recipe_viewer/ui/settings/settings_view_model.dart';
import 'package:buzz_recipe_viewer/ui/video_player/video_player_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class HistoryPage extends HookConsumerWidget {
  const HistoryPage({super.key});

  static Widget show() => const HistoryPage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(historyViewModelProvider.notifier);
    final histories = ref.watch(historyViewModelProvider);
    final useInternalPlayer = ref.watch(
      settingsViewModelProvider.select((value) => value.useInternalPlayer),
    );

    useEffect(
      () {
        Future.microtask(viewModel.initialLoad);
        return null;
      },
      const [],
    );

    return Scaffold(
      body: SafeArea(
        child: histories.isEmpty
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
                  children: histories
                      .map(
                        (e) => Dismissible(
                          key: UniqueKey(),
                          child: InkWell(
                            child: SearchHitWidget(searchHit: e.searchHit),
                            onTap: () async {
                              if (useInternalPlayer) {
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute<void>(
                                    builder: (BuildContext context) {
                                      return VideoPlayerPage(
                                        searchHit: e.searchHit,
                                      );
                                    },
                                  ),
                                );
                              } else {
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
                              }
                            },
                            onLongPress: () async {
                              await viewModel.addFavorite(e.searchHit);
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
