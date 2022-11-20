import 'package:algolia/algolia.dart';
import 'package:buzz_recipe_viewer/model/result.dart';
import 'package:buzz_recipe_viewer/model/search_hit.dart';
import 'package:buzz_recipe_viewer/model/search_result.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final searchRepositoryProvider = Provider((ref) => SearchRepository());

class SearchRepository {
  Future<Result<SearchResult>> search(
    String query,
    String indexName,
    int page,
  ) async {
    return Result.guardFuture(() async {
      try {
        final algoliaClient = Algolia.init(
          applicationId: dotenv.env['ALGOLIA_APPLICATION_ID']!,
          apiKey: dotenv.env['ALGOLIA_API_KEY']!,
        );
        final algoliaQuery = algoliaClient.instance
            .index(indexName)
            .setHitsPerPage(100)
            .setPage(page)
            .query(query);
        final snapshot = await algoliaQuery.getObjects();

        final hits = snapshot.toMap()['hits'] as List<Map<String, Object?>>;
        final searchHits =
            List<SearchHit>.from(hits.map<SearchHit>(SearchHit.fromJson));
        final nextPage =
            snapshot.page + 1 < snapshot.nbPages ? snapshot.page + 1 : 0;
        return SearchResult(searchHits: searchHits, nextPage: nextPage);
      } on Exception catch (_) {
        throw Exception(); // FIXME: use error
      }
    });
  }
}
