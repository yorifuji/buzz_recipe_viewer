import 'dart:io';

import 'package:buzz_recipe_viewer/data/provider/preference_provider.dart';
import 'package:buzz_recipe_viewer/data/repository/firestore/favorite_repository.dart';
import 'package:buzz_recipe_viewer/data/store/video/search_state_store.dart';
import 'package:buzz_recipe_viewer/domain/model/favorite.dart';
import 'package:buzz_recipe_viewer/domain/model/loading_state.dart';
import 'package:buzz_recipe_viewer/domain/model/sort_index.dart';
import 'package:buzz_recipe_viewer/gen/assets.gen.dart';
import 'package:buzz_recipe_viewer/i18n/strings.g.dart';
import 'package:buzz_recipe_viewer/ui/common/app_bar.dart';
import 'package:buzz_recipe_viewer/ui/common/search_hit/video_image_container.dart';
import 'package:buzz_recipe_viewer/ui/common/search_hit/video_information_container.dart';
import 'package:buzz_recipe_viewer/ui/video/video_view_model.dart';
import 'package:buzz_recipe_viewer/ui/video_player/video_player_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class VideoPage extends HookConsumerWidget {
  const VideoPage({super.key});

  static Widget show() => const VideoPage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loadingState = ref.watch(
      searchViewModelProvider.select((value) => value.loadingState),
    );

    useEffect(
      () {
        Future.microtask(ref.read(searchViewModelProvider.notifier).search);
        return null;
      },
      const [],
    );

    return Scaffold(
      appBar: buildAppBar(context, title: t.video.title),
      body: SafeArea(
        child: switch (loadingState) {
          LoadingState.loadable => const SizedBox.shrink(),
          LoadingState.loading =>
            const Center(child: CircularProgressIndicator(strokeWidth: 2)),
          LoadingState.success => _VideoListWidget(),
          LoadingState.failure => const _ErrorWidget()
        },
      ),
    );
  }
}

class _VideoListWidget extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(searchViewModelProvider.notifier);
    final hitList =
        ref.watch(searchStateStoreProvider.select((value) => value.searchHits));
    final moreLoadingState = ref.watch(
      searchViewModelProvider.select((value) => value.moreLoadingState),
    );
    final nextPage =
        ref.watch(searchStateStoreProvider.select((value) => value.nextPage));
    final isInternalPlayerAvailable = !kIsWeb && !Platform.isMacOS;
    final useInternalPlayer = isInternalPlayerAvailable &&
        ref.watch(boolPreferenceProvider(Preference.useInternalPlayer));

    return Column(
      children: [
        if (hitList.isEmpty)
          Expanded(child: Center(child: Text(t.common.searchEmpty)))
        else
          Expanded(
            child: RefreshIndicator(
              onRefresh: viewModel.search,
              child: ListView.builder(
                itemCount: nextPage != 0 ? hitList.length + 1 : hitList.length,
                itemBuilder: (BuildContext context, int index) {
                  if (index == hitList.length) {
                    return moreLoadingState == LoadingState.loading
                        ? const SizedBox(
                            height: 48,
                            child: Center(
                              child: CircularProgressIndicator(strokeWidth: 2),
                            ),
                          )
                        : SizedBox(
                            height: 48,
                            child: TextButton(
                              onPressed: viewModel.searchMore,
                              child: Text(t.common.more),
                            ),
                          );
                  } else {
                    return Column(
                      children: [
                        VideoImageContainer(
                          searchHit: hitList[index],
                          onTap: () async {
                            if (useInternalPlayer) {
                              if (context.mounted) {
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute<void>(
                                    builder: (BuildContext context) {
                                      return VideoPlayerPage(
                                        searchHit: hitList[index],
                                      );
                                    },
                                  ),
                                );
                              }
                            } else {
                              final url = Uri.parse(hitList[index].url);
                              await launchUrl(
                                url,
                                mode: LaunchMode.externalApplication,
                              );
                            }
                          },
                          onLongPress: () async {
                            await ref
                                .read(favoriteRepositoryProvider)
                                .create(Favorite.from(hitList[index]));
                            if (context.mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    t.common.addFavorite,
                                    style: const TextStyle(fontSize: 12),
                                  ),
                                  duration: const Duration(seconds: 1),
                                ),
                              );
                            }
                          },
                        ),
                        VideoInformationContainer(searchHit: hitList[index]),
                      ],
                    );
                  }
                },
              ),
            ),
          ),
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
    );
  }
}

class _SortLabelButton extends ConsumerWidget {
  const _SortLabelButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sortType =
        ref.watch(searchViewModelProvider.select((value) => value.sortType));
    final viewModel = ref.watch(searchViewModelProvider.notifier);

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
    final queryEditController = useTextEditingController(text: query);
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
          hintText: t.common.searchQuery,
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
    Icon(Icons.calendar_month),
    SortIndex.timestamp,
  ),
  likes(
    Icon(Icons.thumb_up),
    SortIndex.likes,
  ),
  views(
    Icon(Icons.trending_up),
    SortIndex.views,
  );

  const SortListTile(this.icon, this.sortType);
  final Widget icon;
  final SortIndex sortType;

  String get title => switch (this) {
        timestamp => t.common.sortByDate,
        likes => t.common.sortByLikes,
        views => t.common.sortByViews,
      };
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

class _ErrorWidget extends ConsumerWidget {
  const _ErrorWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Assets.images.error.image(width: 256, height: 256),
          Text(t.common.fetchFailed),
          TextButton(
            onPressed: () {
              ref.invalidate(searchViewModelProvider);
              ref.read(searchViewModelProvider.notifier).search();
            },
            child: Text(t.video.refresh),
          ),
        ],
      ),
    );
  }
}
