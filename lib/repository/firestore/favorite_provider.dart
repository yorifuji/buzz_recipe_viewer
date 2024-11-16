import 'package:buzz_recipe_viewer/model/favorite.dart';
import 'package:buzz_recipe_viewer/repository/firestore/firestore_path.dart';
import 'package:buzz_recipe_viewer/repository/firestore/firestore_path_provider.dart';
import 'package:buzz_recipe_viewer/ui/favorite/favorite_notifier.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'favorite_provider.g.dart';

extension FavoriteConverter on Favorite {
  static Favorite from(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) =>
      Favorite.fromJson(snapshot.data()!..['id'] = snapshot.id);

  static Map<String, Object?> toCreate(
    Favorite favorite,
    SetOptions? options,
  ) =>
      favorite.toJson()
        ..remove('id')
        ..['createdAt'] = FieldValue.serverTimestamp()
        ..['updatedAt'] = FieldValue.serverTimestamp();

  static Map<String, Object?> toUpdate(
    Favorite favorite,
    SetOptions? options,
  ) =>
      favorite.toJson()
        ..remove('id')
        ..remove('createdAt')
        ..['updatedAt'] = FieldValue.serverTimestamp();
}

@riverpod
CollectionReference<Favorite> favoriteCollection(
  Ref ref,
) {
  final path = ref.watch(firestorePathProvider(FirestorePath.favorites));
  return FirebaseFirestore.instance.collection(path).withConverter(
        fromFirestore: (_, __) => throw UnimplementedError(),
        toFirestore: FavoriteConverter.toCreate,
      );
}

@riverpod
DocumentReference<Favorite> favoriteDocument(
  Ref ref,
  String favoriteId,
) {
  final path = ref.watch(firestorePathProvider(FirestorePath.favorites));
  return FirebaseFirestore.instance
      .doc('$path/$favoriteId')
      .withConverter<Favorite>(
        fromFirestore: FavoriteConverter.from,
        toFirestore: FavoriteConverter.toUpdate,
      );
}

@riverpod
Query<Favorite> favoriteQuery(
  Ref ref,
) {
  final path = ref.watch(
    firestorePathProvider(
      FirestorePath.favorites,
    ),
  );
  return FirebaseFirestore.instance
      .collection(path)
      .orderBy('createdAt', descending: true)
      .withConverter(
        fromFirestore: FavoriteConverter.from,
        toFirestore: (_, __) => throw UnimplementedError(),
      );
}

@riverpod
Stream<({List<Favorite> favorites, bool hasReachedEnd})> favoriteStream(
  Ref ref,
) {
  final windowSize = ref.watch(favoriteWindowNotifierProvider);
  return FirebaseFirestore.instance
      .collection(
        ref.watch(firestorePathProvider(FirestorePath.favorites)),
      )
      .orderBy('createdAt', descending: true)
      .limit(windowSize + 1)
      .withConverter<Favorite>(
        fromFirestore: FavoriteConverter.from,
        toFirestore: (_, __) => throw UnimplementedError(),
      )
      .snapshots()
      .map((snapshot) => snapshot.docs.map((e) => e.data()).toList())
      .map(
        (favorites) => (
          favorites: favorites.take(windowSize).toList(),
          hasReachedEnd: favorites.length <= windowSize
        ),
      );
}
