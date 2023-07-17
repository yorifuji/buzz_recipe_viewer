import 'package:buzz_recipe_viewer/model/favorite.dart';
import 'package:buzz_recipe_viewer/model/search_hit.dart';
import 'package:buzz_recipe_viewer/repository/database_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'favorite_service.g.dart';

@riverpod
FavoriteService favoriteService(FavoriteServiceRef ref) =>
    FavoriteService(ref.watch(databaseRepositoryProvider));

class FavoriteService {
  FavoriteService(this._databaseRepository);
  final DatabaseRepository _databaseRepository;

  Future<void> add(Favorite favorite) =>
      _databaseRepository.insertFavorite(favorite);

  Future<void> delete(Favorite favorite) =>
      _databaseRepository.deleteFavorite(favorite);

  Future<void> deleteBySearchHit(SearchHit searchHit) =>
      _databaseRepository.deleteFavoriteBySearchHit(searchHit);
}
