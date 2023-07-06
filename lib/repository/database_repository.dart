// isarのインスタンスを生成するDatabaseRepositoryのprovider
import 'package:buzz_recipe_viewer/model/favorite.dart';
import 'package:buzz_recipe_viewer/model/history.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:isar/isar.dart';

final databaseRepositoryProvider =
    Provider<DatabaseRepository>((_) => throw UnimplementedError());

class DatabaseRepository {
  DatabaseRepository(this._isar);

  final Isar _isar;

  // get historys
  Future<List<History>> getHistorys() {
    return _isar.historys.where().sortByCreatedAtDesc().findAll();
  }

  // get favorites
  Future<List<Favorite>> getFavorites() {
    return _isar.favorites.where().sortByCreatedAtDesc().findAll();
  }

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

  // watch history
  void watchHistorys({required void Function(void) onChange}) {
    _isar.historys.watchLazy().listen(onChange);
  }

  // watch favorite
  void watchFavorites({required void Function(void) onChange}) {
    _isar.favorites.watchLazy().listen(onChange);
  }
}