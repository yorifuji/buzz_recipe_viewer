import 'package:algolia/algolia.dart';
import 'package:buzz_recipe_viewer/model/search_hit.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final searchRepositoryProvider = Provider((ref) => SearchRepository());

class SearchRepository {
  Future<List<SearchHit>> search(String query, String indexName) async {
    final Algolia algoliaClient = Algolia.init(
      applicationId: dotenv.env["ALGOLIA_APPLICATION_ID"]!,
      apiKey: dotenv.env["ALGOLIA_API_KEY"]!,
    );
    AlgoliaQuery algoliaQuery = algoliaClient.instance
        .index(indexName)
        .setHitsPerPage(100)
        .query(query);
    AlgoliaQuerySnapshot snapshot = await algoliaQuery.getObjects();
    final hits = snapshot.toMap()['hits'] as List;
    // print(hits.length);
    return List<SearchHit>.from(hits.map((hit) => SearchHit.fromJson(hit)));
  }
}
