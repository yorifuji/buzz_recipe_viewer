import 'package:buzz_recipe_viewer/model/isar/search_hit_embedded.dart';
import 'package:buzz_recipe_viewer/model/search_hit.dart';
import 'package:isar/isar.dart';

part 'history.g.dart';

@collection
class History {
  History(this.searchHitEmbedded)
      : createdAt = DateTime.now(),
        updatedAt = DateTime.now(),
        searchHitId = searchHitEmbedded.id!;
  factory History.from(SearchHit searchHit) =>
      History(SearchHitEmbedded()..update(searchHit));

  @ignore
  SearchHit get searchHit => searchHitEmbedded.searchHit();

  Id id = Isar.autoIncrement;
  DateTime createdAt;
  DateTime updatedAt;
  @Index()
  String searchHitId;
  SearchHitEmbedded searchHitEmbedded;
}
