import 'package:buzz_recipe_viewer/model/search_hit.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'favorite.freezed.dart';

@freezed
class Favorite with _$Favorite {
  const factory Favorite({
    required SearchHit searchHit,
    required DateTime createdAt,
    required DateTime updatedAt,
    int? id,
  }) = _Favorite;

  factory Favorite.from(SearchHit searchHit) {
    final now = DateTime.now();
    return Favorite(
      searchHit: searchHit,
      createdAt: now,
      updatedAt: now,
    );
  }
}
