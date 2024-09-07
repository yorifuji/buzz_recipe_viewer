import 'package:buzz_recipe_viewer/model/favorite.dart';
import 'package:buzz_recipe_viewer/repository/firestore/firestore_path.dart';
import 'package:buzz_recipe_viewer/repository/firestore/firestore_path_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
  FavoriteCollectionRef ref,
) {
  final path = ref.watch(firestorePathProvider(FirestorePath.favorites));
  return FirebaseFirestore.instance.collection(path).withConverter(
        fromFirestore: (_, __) => throw UnimplementedError(),
        toFirestore: FavoriteConverter.toCreate,
      );
}

@riverpod
DocumentReference<Favorite> favoriteDocument(
  FavoriteDocumentRef ref,
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
  FavoriteQueryRef ref,
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
Stream<List<Favorite>> favoriteStream(FavoriteStreamRef ref, int limit) =>
    FirebaseFirestore.instance
        .collection(
          ref.watch(firestorePathProvider(FirestorePath.favorites)),
        )
        .orderBy('createdAt', descending: true)
        .limit(limit + 1)
        .withConverter<Favorite>(
          fromFirestore: FavoriteConverter.from,
          toFirestore: (_, __) => throw UnimplementedError(),
        )
        .snapshots()
        .map((snapshot) => snapshot.docs.map((e) => e.data()).toList());
