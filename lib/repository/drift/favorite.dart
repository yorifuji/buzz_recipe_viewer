import 'package:buzz_recipe_viewer/model/favorite.dart';
import 'package:buzz_recipe_viewer/model/search_hit.dart';
import 'package:buzz_recipe_viewer/repository/drift/database.dart';
import 'package:drift/drift.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'favorite.g.dart';

class FavoriteDB extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get createdAt =>
      dateTime().withDefault(Constant(DateTime.now()))();
  DateTimeColumn get updatedAt =>
      dateTime().withDefault(Constant(DateTime.now()))();
  TextColumn get data => text().map(FavoriteData.converter)();
}

@JsonSerializable()
class FavoriteData {
  FavoriteData(
    this.favoriteVideoData,
    this.createdAt,
    this.updatedAt,
  );
  factory FavoriteData.from(Favorite favorite) {
    return FavoriteData(
      FavoriteVideoData.from(favorite.searchHit),
      favorite.createdAt,
      favorite.updatedAt,
    );
  }
  factory FavoriteData.fromJson(Map<String, Object?> json) =>
      _$FavoriteDataFromJson(json);

  FavoriteVideoData favoriteVideoData;
  DateTime createdAt;
  DateTime updatedAt;

  Map<String, Object?> toJson() => _$FavoriteDataToJson(this);

  static TypeConverter<FavoriteData, String> converter = TypeConverter.json(
    fromJson: (json) => FavoriteData.fromJson(json as Map<String, Object?>),
    toJson: (pref) => pref.toJson(),
  );
}

@JsonSerializable()
class FavoriteVideoData {
  FavoriteVideoData(
    this.id,
    this.videoId,
    this.title,
    this.description,
    this.published,
    this.timestamp,
    this.views,
    this.likes,
    this.image,
    this.url,
  );
  factory FavoriteVideoData.from(SearchHit searchHit) {
    return FavoriteVideoData(
      searchHit.id,
      searchHit.videoId,
      searchHit.title,
      searchHit.description,
      searchHit.published,
      searchHit.timestamp,
      searchHit.views,
      searchHit.likes,
      searchHit.image,
      searchHit.url,
    );
  }
  factory FavoriteVideoData.fromJson(Map<String, Object?> json) =>
      _$FavoriteVideoDataFromJson(json);

  String id;
  String videoId;
  String title;
  String description;
  String published;
  int timestamp;
  int views;
  int likes;
  String image;
  String url;

  Map<String, Object?> toJson() => _$FavoriteVideoDataToJson(this);

  // to SearchHit
  SearchHit toSearchHit() {
    return SearchHit(
      id: id,
      videoId: videoId,
      title: title,
      description: description,
      published: published,
      timestamp: timestamp,
      views: views,
      likes: likes,
      image: image,
      url: url,
    );
  }
}

extension FavoriteDBDataExt on FavoriteDBData {
  Favorite toFavorite() {
    return Favorite(
      searchHit: data.favoriteVideoData.toSearchHit(),
      createdAt: data.createdAt,
      updatedAt: data.updatedAt,
      id: id,
    );
  }
}
