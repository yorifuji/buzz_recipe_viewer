import 'package:buzz_recipe_viewer/model/search_hit.dart';
import 'package:buzz_recipe_viewer/model/search_hits_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

void main() async {
  await dotenv.load();
  runApp(const ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Buzz Recipe Viewer',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      home: const SearchHitsWidget(),
    );
  }
}

class SearchHitsWidget extends HookConsumerWidget {
  const SearchHitsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = useScrollController();
    final queryEditController = useTextEditingController();
    final hitList = ref.watch(
      searchHitsProvider.select(
        (value) => value.hitList,
      ),
    );
    final query = ref.watch(
      searchHitsProvider.select(
        (value) => value.query,
      ),
    );
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
                        onPressed: () => openBottomSheet(context),
                        child: const Text(
                          '人気順（閲覧数）',
                          style: TextStyle(fontSize: 12),
                        )),
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
                  viewModel.updateQuery(queryEditController.text);
                  viewModel.search();
                  FocusManager.instance.primaryFocus?.unfocus();
                  _scrollToTop(scrollController);
                },
                controller: queryEditController,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: '検索ワード（例：から揚げ　ナス）',
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: query.isNotEmpty
                        ? IconButton(
                            onPressed: () async {
                              queryEditController.text = '';
                              viewModel.updateQuery('');
                              viewModel.search();
                              _scrollToTop(scrollController);
                            },
                            icon: const Icon(Icons.clear),
                          )
                        : null),
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
                        '${NumberFormat("#,###").format(item.searchHit.likes)} likes'),
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
                        '${NumberFormat("#,###").format(item.searchHit.views)} views'),
                    if (!item.isDescriptionExpanded) ...[
                      const Spacer(),
                      const SizedBox(
                        width: 16,
                        height: 16,
                        child: FittedBox(
                          fit: BoxFit.fill,
                          child: Icon(
                            Icons.expand_more,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        if (item.isDescriptionExpanded)
          InkWell(
            onTap: () {
              viewModel.toogleDescription(item);
            },
            child: Column(children: [
              const Divider(height: 1),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(item.searchHit.description),
              ),
              const SizedBox(height: 8),
            ]),
          ),
      ],
    );
  }
}

openBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.calendar_month),
              title: const Text("追加日（新しい順）"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.thumb_up),
              title: const Text("人気順（いいね）"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.trending_up),
              title: const Text("人気順（閲覧数）"),
              onTap: () {},
            ),
          ],
        ),
      );
    },
  );
}
