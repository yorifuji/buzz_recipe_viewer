import 'package:buzz_recipe_viewer/model/favorite.dart';
import 'package:buzz_recipe_viewer/model/history.dart';
import 'package:buzz_recipe_viewer/model/loading_state.dart';
import 'package:buzz_recipe_viewer/model/sort_index.dart';
import 'package:buzz_recipe_viewer/service/favorite_service.dart';
import 'package:buzz_recipe_viewer/service/history_service.dart';
import 'package:buzz_recipe_viewer/store/recipe_store.dart';
import 'package:buzz_recipe_viewer/store/search_state_store.dart';
import 'package:buzz_recipe_viewer/ui/common/search_hit/video_image_container.dart';
import 'package:buzz_recipe_viewer/ui/common/search_hit/video_information_container.dart';
import 'package:buzz_recipe_viewer/ui/search/search_view_model.dart';
import 'package:buzz_recipe_viewer/ui/settings/settings_view_model.dart';
import 'package:buzz_recipe_viewer/ui/video_player/video_player_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class SearchPage extends ConsumerWidget {
  const SearchPage({super.key});

  static Widget show() => const SearchPage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loadingState = ref.watch(
      searchViewModelProvider.select((value) => value.loadingState),
    );

    final body = switch (loadingState) {
      LoadingState.loadable => const SizedBox.shrink(),
      LoadingState.loading => const Center(child: CircularProgressIndicator()),
      LoadingState.success => _VideoListContainer(),
      LoadingState.failure => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('データを取得できませんでした'),
            ElevatedButton(
              onPressed: () => ref.refresh(searchViewModelProvider),
              child: const Text('再読み込み'),
            ),
          ],
        )
    };

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: body),
            const Padding(
              padding: EdgeInsets.only(top: 8),
              child: _SortLabelButton(),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 8),
              child: Divider(height: 1),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 8),
              child: _SearchBox(),
            ),
          ],
        ),
      ),
    );
  }
}

class _VideoListContainer extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(searchViewModelProvider.notifier);
    final hitList = ref.watch(recipeStoreProvider);
    final moreLoadingState = ref.watch(
      searchViewModelProvider.select((value) => value.moreLoadingState),
    );
    final nextPage =
        ref.watch(searchStateStoreProvider.select((value) => value.nextPage));
    final useInternalPlayer = ref.watch(
      settingsViewModelProvider.select((value) => value.useInternalPlayer),
    );

    if (hitList.isEmpty) {
      return const Center(child: Text('検索結果は0件です'));
    }

    return RefreshIndicator(
      onRefresh: viewModel.search,
      child: ListView.builder(
        itemCount: nextPage != 0 ? hitList.length + 1 : hitList.length,
        itemBuilder: (BuildContext context, int index) {
          if (index == hitList.length) {
            return moreLoadingState == LoadingState.loading
                ? const SizedBox(
                    height: 48,
                    child: Center(child: CircularProgressIndicator()),
                  )
                : SizedBox(
                    height: 48,
                    child: ElevatedButton(
                      onPressed: viewModel.searchMore,
                      child: const Text('もっとみる'),
                    ),
                  );
          } else {
            return Column(
              children: [
                VideoImageContainer(
                  searchHit: hitList[index].searchHit,
                  isLiked: hitList[index].favorite != null,
                  onTap: () async {
                    await ref
                        .read(historyServiceProvider)
                        .add(History.from(hitList[index].searchHit));
                    if (useInternalPlayer) {
                      // ignore: use_build_context_synchronously
                      await Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) {
                            return VideoPlayerPage(
                              searchHit: hitList[index].searchHit,
                            );
                          },
                        ),
                      );
                    } else {
                      final url = Uri.parse(hitList[index].searchHit.url);
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
                  onTapLike: (isLiked) {
                    if (isLiked) {
                      ref
                          .read(favoriteServiceProvider)
                          .add(Favorite.from(hitList[index].searchHit));
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'お気に入りに追加しました',
                            style: TextStyle(fontSize: 12),
                          ),
                          duration: Duration(seconds: 1),
                        ),
                      );
                    } else {
                      ref
                          .read(favoriteServiceProvider)
                          .delete(hitList[index].favorite!);
                    }
                  },
                ),
                VideoInformationContainer(searchHit: hitList[index].searchHit)
              ],
            );
          }
        },
      ),
    );
  }
}

class _SortLabelButton extends HookConsumerWidget {
  const _SortLabelButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sortType =
        ref.watch(searchViewModelProvider.select((value) => value.sortType));
    final viewModel = ref.watch(searchViewModelProvider.notifier);

    useEffect(
      () {
        Future.microtask(viewModel.search);
        return null;
      },
      const [],
    );

    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: SizedBox(
            height: 24,
            child: FloatingActionButton.extended(
              // style: ElevatedButton.styleFrom(
              //   shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.circular(24),
              //   ),
              // ),
              onPressed: () => _openBottomSheet(
                context,
                sortType,
                (sortType) {
                  Navigator.pop(context);
                  viewModel
                    ..updateSortType(sortType)
                    ..search();
                },
              ),
              label: Text(
                SortListTile.values
                    .firstWhere(
                      (element) => element.sortType == sortType,
                    )
                    .title,
                style: const TextStyle(fontSize: 12),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _SearchBox extends HookConsumerWidget {
  const _SearchBox();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final query =
        ref.watch(searchViewModelProvider.select((value) => value.query));
    final queryEditController = useTextEditingController();
    final viewModel = ref.watch(searchViewModelProvider.notifier);
    return SizedBox(
      height: 44,
      child: TextField(
        onEditingComplete: () {
          FocusManager.instance.primaryFocus?.unfocus();
          viewModel
            ..updateQuery(queryEditController.text)
            ..search();
        },
        controller: queryEditController,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: '検索ワード（例：から揚げ　ナス）',
          prefixIcon: const Icon(Icons.search),
          suffixIcon: query.isNotEmpty
              ? IconButton(
                  onPressed: () {
                    queryEditController.text = '';
                    viewModel
                      ..updateQuery('')
                      ..search();
                  },
                  icon: const Icon(Icons.clear),
                )
              : null,
        ),
      ),
    );
  }
}

enum SortListTile {
  timestamp(
    '登録日（新しい順）',
    Icon(Icons.calendar_month),
    SortIndex.timestamp,
  ),
  likes(
    '人気順（いいね）',
    Icon(Icons.thumb_up),
    SortIndex.likes,
  ),
  views(
    '人気順（閲覧数）',
    Icon(Icons.trending_up),
    SortIndex.views,
  );

  const SortListTile(this.title, this.icon, this.sortType);
  final String title;
  final Widget icon;
  final SortIndex sortType;
}

void _openBottomSheet(
  BuildContext context,
  SortIndex sortType,
  void Function(SortIndex) onTap,
) {
  showModalBottomSheet<void>(
    context: context,
    builder: (BuildContext context) {
      return SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: SortListTile.values
              .map(
                (e) => ListTile(
                  leading: e.icon,
                  title: Text(e.title),
                  trailing: e.sortType.indexName == sortType.indexName
                      ? const Icon(Icons.check)
                      : null,
                  onTap: () => onTap(e.sortType),
                ),
              )
              .toList(),
        ),
      );
    },
  );
}
