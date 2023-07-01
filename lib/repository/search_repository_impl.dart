import 'package:algolia/algolia.dart';
import 'package:buzz_recipe_viewer/model/result.dart';
import 'package:buzz_recipe_viewer/model/search_hit.dart';
import 'package:buzz_recipe_viewer/model/search_result.dart';
import 'package:buzz_recipe_viewer/repository/search_repository.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final searchRepositoryProvider =
    Provider<SearchRepository>((ref) => SearchRepositoryImpl());

class SearchRepositoryImpl implements SearchRepository {
  @override
  Future<Result<SearchResult>> search(
    String query,
    String indexName,
    int page,
  ) async {
    return Result.guardFuture(() async {
      try {
        final algoliaClient = Algolia.init(
          applicationId: dotenv.env['ALGOLIA_APPLICATION_ID']!,
          apiKey: dotenv.env['ALGOLIA_SEARCH_ONLY_API_KEY']!,
        );
        final algoliaQuery = algoliaClient.instance
            .index(indexName)
            .setHitsPerPage(100)
            .setPage(page)
            .query(query);
        final snapshot = await algoliaQuery.getObjects();
        final searchHits =
            snapshot.hits.map((e) => SearchHit.fromJson(e.toMap())).toList();
        final nextPage =
            snapshot.page + 1 < snapshot.nbPages ? snapshot.page + 1 : 0;
        return SearchResult(searchHits: searchHits, nextPage: nextPage);
        // ignore: avoid_catches_without_on_clauses
      } catch (_) {
        throw Exception(); // FIXME: use error
      }
    });
  }
}
