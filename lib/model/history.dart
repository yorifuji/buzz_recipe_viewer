import 'package:buzz_recipe_viewer/model/search_hit.dart';
import 'package:isar/isar.dart';

part 'history.g.dart';

@collection
class History {
  History(this.searchHitHistory)
      : createdAt = DateTime.now(),
        updatedAt = DateTime.now();
  factory History.from(SearchHit searchHit) => History(
        SearchHitHistory()
          ..id = searchHit.id
          ..title = searchHit.title
          ..description = searchHit.description
          ..published = searchHit.published
          ..timestamp = searchHit.timestamp
          ..views = searchHit.views
          ..likes = searchHit.likes
          ..image = searchHit.image
          ..url = searchHit.url
          ..objectID = searchHit.objectID,
      );

  @ignore
  SearchHit get searchHit => searchHitHistory.toSearchHit();

  Id id = Isar.autoIncrement;
  DateTime createdAt;
  DateTime updatedAt;
  SearchHitHistory searchHitHistory;
}

@embedded
class SearchHitHistory {
  SearchHit toSearchHit() => SearchHit(
        id: id!,
        title: title!,
        description: description!,
        published: published!,
        timestamp: timestamp!,
        views: views!,
        likes: likes!,
        image: image!,
        url: url!,
        objectID: objectID!,
      );

  String? id;
  String? title;
  String? description;
  String? published;
  int? timestamp;
  int? views;
  int? likes;
  String? image;
  String? url;
  String? objectID;
}
