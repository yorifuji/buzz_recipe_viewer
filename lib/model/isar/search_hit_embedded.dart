import 'package:buzz_recipe_viewer/model/search_hit.dart';
import 'package:isar/isar.dart';

part 'search_hit_embedded.g.dart';

@embedded
class SearchHitEmbedded {
  SearchHit searchHit() => SearchHit(
        id: id!,
        videoId: videoId!,
        title: title!,
        description: description!,
        published: published!,
        timestamp: timestamp!,
        views: views!,
        likes: likes!,
        image: image!,
        url: url!,
      );

  void update(SearchHit searchHit) {
    id = searchHit.id;
    videoId = searchHit.videoId;
    title = searchHit.title;
    description = searchHit.description;
    published = searchHit.published;
    timestamp = searchHit.timestamp;
    views = searchHit.views;
    likes = searchHit.likes;
    image = searchHit.image;
    url = searchHit.url;
  }

  String? id;
  String? videoId;
  String? title;
  String? description;
  String? published;
  int? timestamp;
  int? views;
  int? likes;
  String? image;
  String? url;
}
