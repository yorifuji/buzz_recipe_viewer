import 'package:buzz_recipe_viewer/provider/user_stream_provider.dart';
import 'package:buzz_recipe_viewer/repository/firestore/firestore_path.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firestore_path_provider.g.dart';

@riverpod
String firestorePath(Ref ref, FirestorePath databasePath) {
  final uid = ref.watch(userStreamProvider).asData?.value?.uid ??
      FirebaseAuth.instance.currentUser!.uid;
  return databasePath.path(uid);
}
