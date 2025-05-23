import 'package:buzz_recipe_viewer/data/provider/user_stream_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'storage_path_provider.g.dart';

@riverpod
StoragePath storagePath(Ref ref) {
  final uid = ref.watch(userStreamProvider).asData?.value?.uid ??
      FirebaseAuth.instance.currentUser!.uid;
  return StoragePath(uid);
}

class StoragePath {
  StoragePath(this.uid);

  final String uid;

  String recipeImage({required String fileName}) =>
      'users/$uid/recipes/$fileName';
}
