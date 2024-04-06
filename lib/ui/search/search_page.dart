import 'package:buzz_recipe_viewer/i18n/strings.g.dart';
import 'package:buzz_recipe_viewer/model/loading_state.dart';
import 'package:buzz_recipe_viewer/model/sort_index.dart';
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

class SearchPage extends HookConsumerWidget {
  const SearchPage({super.key});

  static Widget show() => const SearchPage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loadingState = ref.watch(
      searchViewModelProvider.select((value) => value.loadingState),
    );
    final viewModel = ref.watch(searchViewModelProvider.notifier);

    useEffect(
      () {
        Future.microtask(viewModel.search);
        return null;
      },
      const [],
    );

    final body = switch (loadingState) {
      LoadingState.loadable => const SizedBox.shrink(),
      LoadingState.loading => const Center(child: CircularProgressIndicator()),
      LoadingState.success => _VideoListContainer(),
      LoadingState.failure => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(t.common.fetchFailed),
            ElevatedButton(
              onPressed: viewModel.search,
              child: Text(t.common.reload),
            ),
          ],
        )
    };

    return Scaffold(
      appBar: AppBar(title: Text(t.video.title)),
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
    final hitList =
        ref.watch(searchStateStoreProvider.select((value) => value.searchHits));
    final moreLoadingState = ref.watch(
      searchViewModelProvider.select((value) => value.moreLoadingState),
    );
    final nextPage =
        ref.watch(searchStateStoreProvider.select((value) => value.nextPage));
    final useInternalPlayer = ref.watch(
      settingsViewModelProvider.select((value) => value.useInternalPlayer),
    );

    if (hitList.isEmpty) {
      return Center(child: Text(t.common.searchEmpty));
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
                      await Navigator.push(
                        // ignore: use_build_context_synchronously
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) {
                            return VideoPlayerPage(
                              searchHit: hitList[index],
                            );
                          },
                        ),
                      );
                    } else {
                      final url = Uri.parse(hitList[index].url);
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
                VideoInformationContainer(searchHit: hitList[index]),
              ],
            );
          }
        },
      ),
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
