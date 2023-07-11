import 'package:algolia/algolia.dart';
import 'package:buzz_recipe_viewer/model/result.dart';
import 'package:buzz_recipe_viewer/model/search_hit.dart';
import 'package:buzz_recipe_viewer/model/search_result.dart';
import 'package:buzz_recipe_viewer/repository/dotenv_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_repository.g.dart';

@riverpod
SearchRepository searchRepository(SearchRepositoryRef ref) =>
    SearchRepository(ref.read(dotEnvRepositoryProvider));

class SearchRepository {
  SearchRepository(this._dotEnvRepository);

  late final Algolia _algoliaClient = Algolia.init(
    applicationId: _dotEnvRepository.algoliaApplicationId,
    apiKey: _dotEnvRepository.algoliaSearchOnlyApiKey,
  ).instance;

  final DotEnvRepository _dotEnvRepository;

  Future<Result<SearchResult>> search(
    String query,
    String indexName,
    int page,
  ) async {
    return Result.guardFuture(() async {
      try {
        final algoliaQuery = _algoliaClient
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
