import 'package:buzz_recipe_viewer/model/search_hit.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_recipe_result.freezed.dart';

@freezed
class GetRecipeResult with _$GetRecipeResult {
  const factory GetRecipeResult({
    @Default(<SearchHit>[]) List<SearchHit> searchHits,
    @Default(0) int nextPage,
  }) = _GetRecipeResult;
}
