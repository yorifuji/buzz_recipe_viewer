import 'package:buzz_recipe_viewer/model/favorite.dart';
import 'package:buzz_recipe_viewer/provider/database_provider.dart';
import 'package:buzz_recipe_viewer/repository/drift/database.dart';
import 'package:buzz_recipe_viewer/repository/drift/favorite.dart';
import 'package:drift/drift.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'favorite_repository.g.dart';

@Riverpod(dependencies: [])
FavoriteRepository favoriteRepository(FavoriteRepositoryRef ref) =>
    FavoriteRepository(ref.watch(databaseProvider));

class FavoriteRepository {
  FavoriteRepository(this.database);
  AppDatabase database;

  Future<void> create(Favorite favorite) async {
    await database.into(database.favoriteDB).insert(
          FavoriteDBCompanion.insert(
            data: FavoriteData.from(favorite),
            createdAt: Value(favorite.createdAt),
            updatedAt: Value(favorite.updatedAt),
          ),
        );
  }

  Future<List<Favorite>> readAll() async {
    final query = database.select(database.favoriteDB)
      ..orderBy([
        (t) => OrderingTerm(expression: t.updatedAt, mode: OrderingMode.desc),
      ]);
    return query.map((e) => e.toFavorite()).get();
  }

  Future<void> update(Favorite favorite) async {
    await database.update(database.favoriteDB).replace(
          FavoriteDBData(
            id: favorite.id!,
            data: FavoriteData.from(favorite),
            createdAt: favorite.createdAt,
            updatedAt: favorite.updatedAt,
          ),
        );
  }

  Future<void> delete(Favorite favorite) async {
    await (database.delete(database.favoriteDB)
          ..where((tbl) => tbl.id.isValue(favorite.id!)))
        .go();
  }
}

@Riverpod(dependencies: [])
Stream<List<Favorite>> favoriteStream(FavoriteStreamRef ref) {
  final database = ref.watch(databaseProvider);
  final query = database.select(database.favoriteDB)
    ..orderBy([
      (t) => OrderingTerm(expression: t.updatedAt, mode: OrderingMode.desc),
    ]);
  return query.map((e) => e.toFavorite()).watch();
}
