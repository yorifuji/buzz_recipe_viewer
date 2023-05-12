import 'package:buzz_recipe_viewer/model/search_hit.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_result.freezed.dart';

@freezed
class SearchResult with _$SearchResult {
  const factory SearchResult({
    @Default(<SearchHit>[]) List<SearchHit> searchHits,
    @Default(0) int nextPage,
  }) = _SearchResult;

  factory SearchResult.createDummy() =>
      SearchResult(searchHits: [SearchHit.createDummy()]);
}
