import 'package:buzz_recipe_viewer/model/search_hit.dart';
import 'package:buzz_recipe_viewer/viewmodel/search_hits_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class SearchHitsWidget extends HookConsumerWidget {
  const SearchHitsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: const [
            _Contents(),
            Padding(
              padding: EdgeInsets.only(top: 8),
              child: _LabelBox(),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8),
              child: Divider(height: 1),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8),
              child: _SearchBox(),
            ),
          ],
        ),
      ),
    );
  }
}

class _Contents extends HookConsumerWidget {
  const _Contents();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = useScrollController();
    final hitList =
        ref.watch(searchHitsProvider.select((value) => value.hitList));

    final body = hitList.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('データを取得できませんでした'),
          ElevatedButton(
            onPressed: () => ref.refresh(searchHitsProvider),
            child: const Text('再読み込み'),
          ),
        ],
      ),
      data: (hitList) {
        _scrollToTop(scrollController);
        return hitList.isEmpty
            ? const Center(child: Text('検索結果は0件です'))
            : ListView.builder(
                controller: scrollController,
                itemCount: hitList.length,
                itemBuilder: (BuildContext context, int index) {
                  return SearchHitWidget(item: hitList[index]);
                },
              );
      },
    );
    return Expanded(child: body);
  }

  _scrollToTop(ScrollController controller) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      if (controller.hasClients) {
        controller.jumpTo(0.0);
      }
    });
  }
}

class _LabelBox extends HookConsumerWidget {
  const _LabelBox();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sortType =
        ref.watch(searchHitsProvider.select((value) => value.sortType));
    final viewModel = ref.watch(searchHitsProvider.notifier);
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: SizedBox(
            height: 24,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24.0),
                ),
              ),
              onPressed: () => openBottomSheet(
                context,
                sortType,
                (sortType) {
                  Navigator.pop(context);
                  viewModel.updateSortType(sortType);
                  viewModel.search();
                },
              ),
              child: Text(
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
    final query = ref.watch(searchHitsProvider.select((value) => value.query));
    final queryEditController = useTextEditingController();
    final viewModel = ref.watch(searchHitsProvider.notifier);
    return SizedBox(
      height: 44,
      child: TextField(
        onEditingComplete: () {
          FocusManager.instance.primaryFocus?.unfocus();
          viewModel.updateQuery(queryEditController.text);
          viewModel.search();
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
                    viewModel.updateQuery('');
                    viewModel.search();
                  },
                  icon: const Icon(Icons.clear),
                )
              : null,
        ),
      ),
    );
  }
}

class SearchHitWidget extends HookConsumerWidget {
  const SearchHitWidget({super.key, required this.item});

  final SearchHitItem item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(searchHitsProvider.notifier);
    return Column(
      children: [
        InkWell(
          onTap: () async {
            final Uri url = Uri.parse(item.searchHit.url);
            if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
              throw 'Could not launch $url';
            }
          },
          child: Column(
            children: [
              Image.network(item.searchHit.image),
              const SizedBox(height: 8),
            ],
          ),
        ),
        InkWell(
          onTap: () {
            viewModel.toogleDescription(item);
          },
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(item.searchHit.title),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 16,
                      height: 16,
                      child: FittedBox(
                        fit: BoxFit.fill,
                        child: Icon(
                          Icons.thumb_up,
                        ),
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      '${NumberFormat("#,###").format(item.searchHit.likes)} likes',
                    ),
                    const SizedBox(width: 12),
                    const SizedBox(
                      width: 16,
                      height: 16,
                      child: FittedBox(
                        fit: BoxFit.fill,
                        child: Icon(
                          Icons.trending_up,
                        ),
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      '${NumberFormat("#,###").format(item.searchHit.views)} views',
                    ),
                    const SizedBox(width: 12),
                    const SizedBox(
                      width: 16,
                      height: 16,
                      child: FittedBox(
                        fit: BoxFit.fill,
                        child: Icon(
                          Icons.calendar_month,
                        ),
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      DateFormat('yyyy-MM-dd').format(
                        DateTime.fromMillisecondsSinceEpoch(
                          item.searchHit.publishedTimestamp * 1000,
                        ),
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: 16,
                      height: 16,
                      child: FittedBox(
                        fit: BoxFit.fill,
                        child: Icon(
                          item.isDescriptionExpanded
                              ? Icons.expand_less
                              : Icons.expand_more,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        if (item.isDescriptionExpanded)
          InkWell(
            onTap: () {
              viewModel.toogleDescription(item);
            },
            child: Column(
              children: [
                const Divider(height: 1),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
                  child: Text(item.searchHit.description),
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
      ],
    );
  }
}

enum SortListTile {
  timestamp(
    '追加日（新しい順）',
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

  final String title;
  final Widget icon;
  final SortIndex sortType;
  const SortListTile(this.title, this.icon, this.sortType);
}

openBottomSheet(
  BuildContext context,
  SortIndex sortType,
  void Function(SortIndex) onTap,
) {
  showModalBottomSheet(
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
                  trailing: e == sortType ? const Icon(Icons.check) : null,
                  onTap: () => onTap(e.sortType),
                ),
              )
              .toList(),
        ),
      );
    },
  );
}
