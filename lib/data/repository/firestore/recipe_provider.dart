import 'package:buzz_recipe_viewer/data/repository/firestore/firestore_path.dart';
import 'package:buzz_recipe_viewer/data/repository/firestore/firestore_path_provider.dart';
import 'package:buzz_recipe_viewer/domain/model/recipe.dart';
import 'package:buzz_recipe_viewer/ui/recipe/recipe_notifier.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'recipe_provider.g.dart';

extension RecipeConverter on Recipe {
  static Recipe from(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) =>
      Recipe.fromJson(snapshot.data()!..['recipeId'] = snapshot.id);

  static Map<String, Object?> toCreate(Recipe recipe, SetOptions? options) =>
      recipe.toJson()
        ..remove('recipeId')
        ..['createdAt'] = FieldValue.serverTimestamp()
        ..['updatedAt'] = FieldValue.serverTimestamp();

  static Map<String, Object?> toUpdate(Recipe recipe, SetOptions? options) =>
      recipe.toJson()
        ..remove('recipeId')
        ..remove('createdAt')
        ..['updatedAt'] = FieldValue.serverTimestamp();
}

@riverpod
CollectionReference<Recipe> recipeCollection(
  Ref ref,
) {
  final path = ref.watch(firestorePathProvider(FirestorePath.recipes));
  return FirebaseFirestore.instance.collection(path).withConverter(
        fromFirestore: (_, __) => throw UnimplementedError(),
        toFirestore: RecipeConverter.toCreate,
      );
}

@riverpod
DocumentReference<Recipe> recipeDocument(
  Ref ref,
  RecipeId recipeId,
) {
  final path = ref.watch(firestorePathProvider(FirestorePath.recipes));
  return FirebaseFirestore.instance.doc('$path/$recipeId').withConverter(
        fromFirestore: RecipeConverter.from,
        toFirestore: RecipeConverter.toUpdate,
      );
}

@riverpod
Query<Recipe> recipeQuery(
  Ref ref,
) {
  final path = ref.watch(
    firestorePathProvider(
      FirestorePath.recipes,
    ),
  );
  return FirebaseFirestore.instance
      .collection(path)
      .orderBy('createdAt', descending: true)
      .withConverter(
        fromFirestore: RecipeConverter.from,
        toFirestore: (_, __) => throw UnimplementedError(),
      );
}

@riverpod
Stream<({List<Recipe> recipes, bool hasReachedEnd})> recipeStream(Ref ref) {
  final windowSize = ref.watch(recipeWindowNotifierProvider);
  return FirebaseFirestore.instance
      .collection(
        ref.watch(firestorePathProvider(FirestorePath.recipes)),
      )
      .orderBy('createdAt', descending: true)
      .limit(windowSize + 1)
      .withConverter<Recipe>(
        fromFirestore: RecipeConverter.from,
        toFirestore: (_, __) => throw UnimplementedError(),
      )
      .snapshots()
      .map((snapshot) => snapshot.docs.map((e) => e.data()).toList())
      .map(
        (recipes) => (
          recipes: recipes.take(windowSize).toList(),
          hasReachedEnd: recipes.length <= windowSize
        ),
      );
}
