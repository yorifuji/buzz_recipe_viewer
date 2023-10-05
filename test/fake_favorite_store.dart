import 'package:buzz_recipe_viewer/model/isar/favorite.dart';
import 'package:buzz_recipe_viewer/store/favorite_store.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'fake_favorite_store.g.dart';

@riverpod
class FakeFavoriteStore extends _$FakeFavoriteStore implements FavoriteStore {
  @override
  List<Favorite> build() {
    return [];
  }
}
