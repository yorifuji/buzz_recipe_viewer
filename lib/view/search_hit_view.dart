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
    final scrollController = useScrollController();
    final queryController = useTextEditingController();
    final hitList =
        ref.watch(searchHitsProvider.select((value) => value.hitList));
    final query = ref.watch(searchHitsProvider.select((value) => value.query));
    final sortType =
        ref.watch(searchHitsProvider.select((value) => value.sortType));
    final viewModel = ref.watch(searchHitsProvider.notifier);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: hitList.isEmpty
                  ? const Center(child: Text('No results'))
                  : ListView.builder(
                      controller: scrollController,
                      itemCount: hitList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return SearchHitWidget(item: hitList[index]);
                      },
                    ),
            ),
            const SizedBox(height: 8),
            Row(
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
                          _scrollToTop(scrollController);
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
            ),
            const SizedBox(height: 8),
            const Divider(height: 1),
            SizedBox(
              height: 44,
              child: TextField(
                onEditingComplete: () async {
                  viewModel.updateQuery(queryController.text);
                  viewModel.search();
                  FocusManager.instance.primaryFocus?.unfocus();
                  _scrollToTop(scrollController);
                },
                controller: queryController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: '検索ワード（例：から揚げ　ナス）',
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: query.isNotEmpty
                      ? IconButton(
                          onPressed: () async {
                            queryController.text = '';
                            viewModel.updateQuery('');
                            viewModel.search();
                            _scrollToTop(scrollController);
                          },
                          icon: const Icon(Icons.clear),
                        )
                      : null,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _scrollToTop(ScrollController controller) {
    if (controller.hasClients) {
      SchedulerBinding.instance
          .addPostFrameCallback((_) => controller.jumpTo(0.0));
    }
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
                    const SizedBox(width: 8),
                    Text(
                      '${NumberFormat("#,###").format(item.searchHit.likes)} likes',
                    ),
                    const SizedBox(width: 16),
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
                    const SizedBox(width: 8),
                    Text(
                      '${NumberFormat("#,###").format(item.searchHit.views)} views',
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