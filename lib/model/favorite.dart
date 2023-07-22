import 'package:buzz_recipe_viewer/model/search_hit.dart';
import 'package:buzz_recipe_viewer/model/search_hit_embedded.dart';
import 'package:isar/isar.dart';

part 'favorite.g.dart';

@collection
class Favorite {
  Favorite(this.searchHitEmbedded)
      : createdAt = DateTime.now(),
        updatedAt = DateTime.now(),
        searchHitId = searchHitEmbedded.id!;
  factory Favorite.from(SearchHit searchHit) =>
      Favorite(SearchHitEmbedded()..update(searchHit));

  @ignore
  SearchHit get searchHit => searchHitEmbedded.searchHit();

  Id id = Isar.autoIncrement;
  DateTime createdAt;
  DateTime updatedAt;
  @Index()
  String searchHitId;
  SearchHitEmbedded searchHitEmbedded;
}
