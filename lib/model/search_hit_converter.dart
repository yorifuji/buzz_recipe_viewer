import 'package:buzz_recipe_viewer/model/search_hit.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class SearchHitField implements JsonConverter<SearchHit, dynamic> {
  const SearchHitField();

  @override
  SearchHit fromJson(dynamic json) {
    return SearchHit.fromJson(json as Map<String, Object?>);
  }

  @override
  dynamic toJson(SearchHit searchHit) {
    return searchHit.toJson();
  }
}
