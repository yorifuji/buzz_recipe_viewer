import 'package:algolia/algolia.dart';
import 'package:buzz_recipe_viewer/model/get_recipe_result.dart';
import 'package:buzz_recipe_viewer/model/result.dart';
import 'package:buzz_recipe_viewer/model/search_hit.dart';
import 'package:buzz_recipe_viewer/provider/algolia_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'recipe_repository.g.dart';

@riverpod
RecipeRepository recipeRepository(RecipeRepositoryRef ref) =>
    RecipeRepository(ref.watch(algoliaProvider));

class RecipeRepository {
  RecipeRepository(this._algoliaClient);
  final Algolia _algoliaClient;

  Future<Result<GetRecipeResult>> getRecipe(
    String query,
    String indexName,
    int page,
  ) async {
    return Result.guardFuture(() async {
      try {
        final algoliaQuery = _algoliaClient
            .index(indexName)
            .setHitsPerPage(50)
            .setPage(page)
            .query(query);
        final snapshot = await algoliaQuery.getObjects();
        final searchHits =
            snapshot.hits.map((e) => SearchHit.fromJson(e.toMap())).toList();
        final nextPage =
            snapshot.page + 1 < snapshot.nbPages ? snapshot.page + 1 : 0;
        return GetRecipeResult(searchHits: searchHits, nextPage: nextPage);
        // ignore: avoid_catches_without_on_clauses
      } catch (_) {
        throw Exception(); // FIXME: use error
      }
    });
  }
}
