import 'package:algolia/algolia.dart';
import 'package:buzz_recipe_viewer/model/search_hit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

void main() async {
  await dotenv.load();
  runApp(const MyApp());
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
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Algolia _algoliaClient = Algolia.init(
    applicationId: dotenv.env["APPLICATION_ID"]!,
    apiKey: dotenv.env["API_KEY"]!,
  );

  String _searchText = "";
  List<SearchHitViewItem> _searchHitViewItemList = [];
  final _textFieldController = TextEditingController();

  Future<void> _getSearchResult(String query) async {
    AlgoliaQuery algoliaQuery = _algoliaClient.instance
        .index("recipe_views_desc")
        .setHitsPerPage(100)
        .query(query);
    AlgoliaQuerySnapshot snapshot = await algoliaQuery.getObjects();
    final hits = snapshot.toMap()['hits'] as List;
    final searchHitList =
        List<SearchHit>.from(hits.map((hit) => SearchHit.fromJson(hit)));
    setState(() {
      _searchHitViewItemList =
          searchHitList.map((e) => SearchHitViewItem(searchHit: e)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: _searchHitViewItemList.isEmpty
                  ? const Center(child: Text('No results'))
                  : ListView.builder(
                      itemCount: _searchHitViewItemList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return SearchHitView(
                            searchHitViewItem: _searchHitViewItemList[index]);
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
            SizedBox(
              height: 44,
              child: TextField(
                onEditingComplete: () {
                  if (_searchText != _textFieldController.text) {
                    setState(() {
                      _searchText = _textFieldController.text;
                    });
                    _getSearchResult(_searchText);
                  }
                },
                controller: _textFieldController,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter a search term',
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: _searchText.isNotEmpty
                        ? IconButton(
                            onPressed: () {
                              _textFieldController.clear();
                              setState(
                                () {
                                  _searchText = '';
                                  _getSearchResult(_searchText);
                                },
                              );
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

  @override
  void initState() {
    super.initState();
    _getSearchResult('');
  }

  @override
  void dispose() {
    _textFieldController.dispose();
    super.dispose();
  }
}

class SearchHitView extends StatelessWidget {
  const SearchHitView({super.key, required this.searchHitViewItem});

  final SearchHitViewItem searchHitViewItem;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () async {
            final Uri url = Uri.parse(searchHitViewItem.searchHit.url);
            if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
              throw 'Could not launch $url';
            }
          },
          child: Column(
            children: [
              Image.network(searchHitViewItem.searchHit.image),
              const SizedBox(height: 8),
            ],
          ),
        ),
        InkWell(
          onTap: () {},
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(searchHitViewItem.searchHit.title),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
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
                  '${NumberFormat("#,###").format(searchHitViewItem.searchHit.likes)} likes'),
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
                  '${NumberFormat("#,###").format(searchHitViewItem.searchHit.views)} views'),
            ],
          ),
        ),
        const SizedBox(height: 8),
        // if (searchHitViewItem.isDescriptionExpanded || true) ...[
        //   const Divider(),
        //   Padding(
        //     padding: const EdgeInsets.symmetric(horizontal: 8),
        //     child: Text(searchHitViewItem.searchHit.description),
        //   ),
        //   const SizedBox(height: 8),
        // ]
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
