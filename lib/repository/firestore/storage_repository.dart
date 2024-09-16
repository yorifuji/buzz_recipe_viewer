import 'dart:io';

import 'package:buzz_recipe_viewer/model/result.dart';
import 'package:buzz_recipe_viewer/model/storage_exception.dart';
import 'package:buzz_recipe_viewer/model/storage_image.dart';
import 'package:buzz_recipe_viewer/repository/firestore/storage_path_provider.dart';
import 'package:collection/collection.dart';
import 'package:cross_file/cross_file.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

part 'storage_repository.g.dart';

@riverpod
StorageRepository storageRepository(StorageRepositoryRef ref) =>
    StorageRepository(ref.watch(storagePathProvider));

class StorageRepository {
  StorageRepository(this._storagePath);

  final StoragePath _storagePath;

  Future<String> _uploadFile(
    XFile uploadFile,
    String uploadPath,
  ) async {
    final fileRef = FirebaseStorage.instance.ref(uploadPath);
    await fileRef.putFile(File(uploadFile.path));
    return fileRef.getDownloadURL();
  }

  Future<Result<List<StorageImage>, StorageException>> uploadRecipeImageList(
    List<XFile> uploadFiles,
  ) async {
    try {
      final futures = uploadFiles.mapIndexed((index, file) {
        final imageId = const Uuid().v4();
        final uploadPath = _storagePath.recipeImage(fileName: imageId);
        return _uploadFile(file, uploadPath)
            .then((url) => (index: index, imageId: imageId, url: url));
      }).toList();

      final result = await Future.wait(futures);

      result.sort((a, b) => a.index - b.index);
      return Result.success(
        data: result
            .map((e) => StorageImage(imageId: e.imageId, url: e.url))
            .toList(),
      );
    } on FirebaseException catch (e) {
      return Result.failure(error: StorageException.from(e));
    }
  }
}
