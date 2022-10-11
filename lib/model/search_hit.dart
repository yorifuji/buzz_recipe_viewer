import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

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
}

@freezed
class SearchHitItem with _$SearchHitItem {
  const factory SearchHitItem({
    required SearchHit searchHit,
    @Default(false) bool isDescriptionExpanded,
  }) = _SearchHitItem;
}
