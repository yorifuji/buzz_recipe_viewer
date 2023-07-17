import 'package:buzz_recipe_viewer/model/favorite.dart';
import 'package:buzz_recipe_viewer/model/history.dart';
import 'package:buzz_recipe_viewer/model/search_hit.dart';
import 'package:buzz_recipe_viewer/model/search_hit_embedded.dart';
import 'package:buzz_recipe_viewer/provider/isar_provider.dart';
import 'package:isar/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'database_repository.g.dart';

@riverpod
DatabaseRepository databaseRepository(DatabaseRepositoryRef ref) {
  return DatabaseRepository(ref.watch(isarProvider));
}

class DatabaseRepository {
  DatabaseRepository(this._isar);

  final Isar _isar;

  // get historys
  Future<List<History>> get getHistorys =>
      _isar.historys.where().sortByCreatedAtDesc().findAll();

  // get favorites
  Future<List<Favorite>> get getFavorites =>
      _isar.favorites.where().sortByCreatedAtDesc().findAll();

  // put history
  Future<void> insertHistory(History history) async {
    await _isar.writeTxn(() async {
      await _isar.historys.put(history);
    });
  }

  // put favorite
  Future<void> insertFavorite(Favorite favorite) async {
    await _isar.writeTxn(() async {
      await _isar.favorites.put(favorite);
    });
  }

  // delete history
  Future<void> deleteHistory(History history) async {
    await _isar.writeTxn(() async {
      await _isar.historys.delete(history.id);
    });
  }

  // delete favorite
  Future<void> deleteFavorite(Favorite favorite) async {
    await _isar.writeTxn(() async {
      await _isar.favorites.delete(favorite.id);
    });
  }

  // delete favorite
  Future<void> deleteFavoriteBySearchHit(SearchHit searchHit) async {
    await _isar.writeTxn(() async {
      await _isar.favorites
          .filter()
          .searchHitEmbedded((q) => q.idEqualTo(searchHit.id))
          .deleteAll();
    });
  }

  // watch history
  void watchHistorys({required void Function(void) onChange}) {
    _isar.historys.watchLazy().listen(onChange);
  }

  // watch favorite
  void watchFavorites({required void Function(void) onChange}) {
    _isar.favorites.watchLazy().listen(onChange);
  }
}
