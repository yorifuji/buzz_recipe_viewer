import 'package:buzz_recipe_viewer/model/favorite.dart';
import 'package:buzz_recipe_viewer/repository/firestore/favorite_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'favorite_repository.g.dart';

@riverpod
FavoriteRepository favoriteRepository(Ref ref) => FavoriteRepository(ref);

class FavoriteRepository {
  FavoriteRepository(this._ref);
  final Ref _ref;

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

  // delete all
  Future<void> deleteAll() async {
    final batch = FirebaseFirestore.instance.batch();
    final snapshot = await _ref.read(favoriteQueryProvider).get();
    snapshot.docs.map((doc) => doc.reference).forEach(batch.delete);
    await batch.commit();
  }
}
