import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_hit.freezed.dart';
part 'search_hit.g.dart';

@freezed
class SearchHit with _$SearchHit {
  const factory SearchHit({
    required String id,
    required String title,
    required String description,
    required String published,
    required int timestamp,
    required int views,
    required int likes,
    required String image,
    required String url,
    required String objectID,
  }) = _SearchHit;

  factory SearchHit.fromJson(Map<String, Object?> json) =>
      _$SearchHitFromJson(json);

  factory SearchHit.createDummy() => const SearchHit(
        id: 'id',
        title: 'タイトルタイトルタイトルタイトルタイトルタイトルタイトル',
        description: '説明説明説明説明説明説明説明説明説明説明説明',
        published: 'published',
        timestamp: 0,
        views: 12345,
        likes: 12345,
        image: 'https://yorifuji.github.io/public/images/1920x1080_black.png',
        objectID: 'objectID',
        url: 'https://yorifuji.github.io/public/images/1920x1080.png',
      );
}

@freezed
class SearchHitItem with _$SearchHitItem {
  const factory SearchHitItem({
    required SearchHit searchHit,
  }) = _SearchHitItem;
}
