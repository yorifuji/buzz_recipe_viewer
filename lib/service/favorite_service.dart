import 'package:buzz_recipe_viewer/model/favorite.dart';
import 'package:buzz_recipe_viewer/model/search_hit.dart';
import 'package:buzz_recipe_viewer/repository/favorite_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'favorite_service.g.dart';

@riverpod
FavoriteService favoriteService(FavoriteServiceRef ref) =>
    FavoriteService(ref.watch(favoriteRepositoryProvider));

class FavoriteService {
  FavoriteService(this.repository);
  FavoriteRepository repository;

  Future<void> create(SearchHit searchHit) =>
      repository.create(Favorite.from(searchHit));

  Future<List<Favorite>> readAll() => repository.readAll();

  Future<void> delete(Favorite favorite) => repository.delete(favorite);
}
