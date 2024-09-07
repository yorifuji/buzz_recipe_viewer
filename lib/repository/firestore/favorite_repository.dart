import 'package:buzz_recipe_viewer/model/favorite.dart';
import 'package:buzz_recipe_viewer/model/result.dart';
import 'package:buzz_recipe_viewer/repository/firestore/favorite_provider.dart';
import 'package:buzz_recipe_viewer/repository/firestore/firestore_error.dart';
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

  // read
  Future<List<Favorite>> read({required int limit}) async {
    final snapshot = await _ref.read(favoriteQueryProvider).limit(limit).get();
    return snapshot.docs.map((e) => e.data()).toList();
  }

  // read before document
  Future<Result<List<Favorite>, FirestoreError>> readBefore({
    required Favorite favorite,
    required int limit,
  }) async {
    final favoriteRef =
        await _ref.read(favoriteDocumentProvider(favorite.id!)).get();
    if (!favoriteRef.exists) {
      return const Result.failure(error: FirestoreError.documentNotFound);
    }
    final snapshot = await _ref
        .read(favoriteQueryProvider)
        .limit(limit)
        .endBeforeDocument(favoriteRef)
        .get();
    return Result.success(data: snapshot.docs.map((e) => e.data()).toList());
  }

  // read after document
  Future<Result<List<Favorite>, FirestoreError>> readAfter({
    required Favorite favorite,
    required int limit,
  }) async {
    final favoriteRef =
        await _ref.read(favoriteDocumentProvider(favorite.id!)).get();
    if (!favoriteRef.exists) {
      return const Result.failure(error: FirestoreError.documentNotFound);
    }
    final snapshot = await _ref
        .read(favoriteQueryProvider)
        .limit(limit)
        .startAfterDocument(favoriteRef)
        .get();
    return Result.success(data: snapshot.docs.map((e) => e.data()).toList());
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
