import 'package:buzz_recipe_viewer/model/result.dart';
import 'package:buzz_recipe_viewer/model/search_result.dart';
import 'package:buzz_recipe_viewer/repository/search_repository.dart';

class MockSearchRepository implements SearchRepository {
  @override
  Future<Result<SearchResult>> search(
    String query,
    String indexName,
    int page,
  ) async {
    return Result.success(
      data: SearchResult.createDummy(),
    );
  }
}
