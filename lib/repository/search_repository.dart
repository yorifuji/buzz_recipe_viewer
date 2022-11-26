import 'package:buzz_recipe_viewer/model/result.dart';
import 'package:buzz_recipe_viewer/model/search_result.dart';

// ignore: one_member_abstracts
abstract class SearchRepository {
  Future<Result<SearchResult>> search(
    String query,
    String indexName,
    int page,
  );
}
