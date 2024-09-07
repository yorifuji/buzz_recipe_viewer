import 'package:buzz_recipe_viewer/model/search_hit.dart';
import 'package:buzz_recipe_viewer/model/search_hit_converter.dart';
import 'package:buzz_recipe_viewer/model/timestamp_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'favorite.freezed.dart';
part 'favorite.g.dart';

@freezed
class Favorite with _$Favorite {
  const factory Favorite({
    @SearchHitField() required SearchHit searchHit,
    @CreatedAtField() required DateTime createdAt,
    @UpdatedAtField() required DateTime updatedAt,
    String? id,
  }) = _Favorite;

  const Favorite._();

  factory Favorite.fromJson(Map<String, Object?> json) =>
      _$FavoriteFromJson(json);

  factory Favorite.from(SearchHit searchHit) {
    final now = DateTime.now();
    return Favorite(
      searchHit: searchHit,
      createdAt: now,
      updatedAt: now,
    );
  }
}
