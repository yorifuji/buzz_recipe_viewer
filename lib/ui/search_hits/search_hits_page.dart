import 'package:buzz_recipe_viewer/model/loading_state.dart';
import 'package:buzz_recipe_viewer/model/sort_index.dart';
import 'package:buzz_recipe_viewer/repository/mock_search_repository.dart';
import 'package:buzz_recipe_viewer/repository/search_repository_impl.dart';
import 'package:buzz_recipe_viewer/ui/search_hit/search_hit_container.dart';
import 'package:buzz_recipe_viewer/ui/search_hits/search_hits_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class SearchHitsPage extends StatelessWidget {
  const SearchHitsPage({super.key});

  static Widget show() => const SearchHitsPage();
  static Widget showWithMock() => ProviderScope(
        overrides: [
          searchRepositoryProvider.overrideWithValue(MockSearchRepository())
        ],
        child: const SearchHitsPage(),
      );

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _SearchHitResult(),
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

class _SearchHitResult extends HookConsumerWidget {
  const _SearchHitResult();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = useScrollController();

    final hitList =
        ref.watch(searchHitsViewModelProvider.select((value) => value.hitList));
    final loadingState = ref.watch(
      searchHitsViewModelProvider.select((value) => value.loadingState),
    );
    final moreLoadingState = ref.watch(
      searchHitsViewModelProvider.select((value) => value.moreLoadingState),
    );
    final nextPage = ref
        .watch(searchHitsViewModelProvider.select((value) => value.nextPage));
    final viewModel = ref.watch(searchHitsViewModelProvider.notifier);

    final Widget body;
    switch (loadingState) {
      case LoadingState.loadable:
        body = const SizedBox.shrink();
      case LoadingState.loading:
        body = const Center(child: CircularProgressIndicator());
      case LoadingState.success:
        // _scrollToTop(scrollController);
        body = hitList.isEmpty
            ? const Center(child: Text('検索結果は0件です'))
            : ListView.builder(
                controller: scrollController,
                itemCount: nextPage != 0 ? hitList.length + 1 : hitList.length,
                itemBuilder: (BuildContext context, int index) {
                  if (index == hitList.length) {
                    return moreLoadingState == LoadingState.loading
                        ? const SizedBox(
                            height: 64,
                            child: Center(child: CircularProgressIndicator()),
                          )
                        : SizedBox(
                            height: 64,
                            child: ElevatedButton(
                              onPressed: viewModel.searchMore,
                              // style: ElevatedButton.styleFrom(
                              //   backgroundColor: Colors.white,
                              //   foregroundColor: Colors.black,
                              // ),
                              child: const Text('もっとみる'),
                            ),
                          );
                  } else {
                    return InkWell(
                      child: SearchHitWidget(
                        searchHit: hitList[index].searchHit,
                      ),
                      onTap: () async {
                        final url = Uri.parse(hitList[index].searchHit.url);
                        if (await launchUrl(
                          url,
                          mode: LaunchMode.externalApplication,
                        )) {
                          await viewModel
                              .insertHistory(hitList[index].searchHit);
                        } else {
                          // FIXME:
                          // ignore: only_throw_errors
                          throw 'Could not launch $url';
                        }
                      },
                      onLongPress: () async {
                        await viewModel.addFavorite(hitList[index].searchHit);
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
                    );
                  }
                },
              );
      case LoadingState.failure:
        body = Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('データを取得できませんでした'),
            ElevatedButton(
              onPressed: () => ref.refresh(searchHitsViewModelProvider),
              child: const Text('再読み込み'),
            ),
          ],
        );
    }
    return Expanded(child: body);
  }

  // _scrollToTop(ScrollController controller) {
  //   SchedulerBinding.instance.addPostFrameCallback((_) {
  //     if (controller.hasClients) {
  //       controller.jumpTo(0.0);
  //     }
  //   });
  // }
}

class _LabelBox extends HookConsumerWidget {
  const _LabelBox();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sortType = ref
        .watch(searchHitsViewModelProvider.select((value) => value.sortType));
    final viewModel = ref.watch(searchHitsViewModelProvider.notifier);

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
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
              onPressed: () => openBottomSheet(
                context,
                sortType,
                (sortType) {
                  Navigator.pop(context);
                  viewModel
                    ..updateSortType(sortType)
                    ..search();
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
    final query =
        ref.watch(searchHitsViewModelProvider.select((value) => value.query));
    final queryEditController = useTextEditingController();
    final viewModel = ref.watch(searchHitsViewModelProvider.notifier);
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

void openBottomSheet(
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
