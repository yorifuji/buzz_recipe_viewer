import 'package:buzz_recipe_viewer/model/search_hit.dart';
import 'package:isar/isar.dart';

part 'search_hit_embedded.g.dart';

@embedded
class SearchHitEmbedded {
  SearchHit searchHit() => SearchHit(
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

  void update(SearchHit searchHit) {
    id = searchHit.id;
    title = searchHit.title;
    description = searchHit.description;
    published = searchHit.published;
    timestamp = searchHit.timestamp;
    views = searchHit.views;
    likes = searchHit.likes;
    image = searchHit.image;
    url = searchHit.url;
    objectID = searchHit.objectID;
  }

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
