import 'package:buzz_recipe_viewer/model/favorite.dart';
import 'package:buzz_recipe_viewer/repository/firestore/favorite_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'favorite_repository.g.dart';

@riverpod
FavoriteRepository favoriteRepository(FavoriteRepositoryRef ref) =>
    FavoriteRepository(ref);

class FavoriteRepository {
  FavoriteRepository(this._ref);
  final FavoriteRepositoryRef _ref;

  // create
  Future<String> create(Favorite favorite) async {
    final docRef = await _ref.read(favoriteCollectionProvider).add(favorite);
    return docRef.id;
  }

  // update
  Future<void> update(Favorite favorite) async {
    await _ref
        .read(favoriteDocumentProvider(favorite.id!))
        .set(favorite, SetOptions(merge: true));
  }

  // delete
  Future<void> delete(Favorite favorite) async {
    await _ref.read(favoriteDocumentProvider(favorite.id!)).delete();
  }

  // delete all favorites
  Future<void> deleteAll() async {
    final snapshot = await _ref.read(favoriteQueryProvider).get();
    final futures = snapshot.docs.map((doc) => doc.reference.delete());
    await Future.wait(futures);
  }
}
