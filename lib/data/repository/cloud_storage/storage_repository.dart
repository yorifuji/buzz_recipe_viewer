import 'dart:io';

import 'package:buzz_recipe_viewer/data/repository/cloud_storage/storage_path_provider.dart';
import 'package:buzz_recipe_viewer/domain/model/content_type.dart';
import 'package:buzz_recipe_viewer/domain/model/result.dart';
import 'package:buzz_recipe_viewer/domain/model/storage_exception.dart';
import 'package:buzz_recipe_viewer/domain/model/storage_image.dart';
import 'package:collection/collection.dart';
import 'package:cross_file/cross_file.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

part 'storage_repository.g.dart';

@riverpod
StorageRepository storageRepository(Ref ref) =>
    StorageRepository(ref.watch(storagePathProvider));

class StorageRepository {
  StorageRepository(this._storagePath);

  final StoragePath _storagePath;

  Future<String> _uploadFile(
    XFile uploadFile,
    String uploadPath,
  ) async {
    final bytes = kIsWeb
        ? await uploadFile.readAsBytes()
        : await File(uploadFile.path).readAsBytes();
    final metadata = kIsWeb
        ? SettableMetadata(contentType: uploadFile.mimeType)
        : SettableMetadata(
            contentType: ContentType.fromPath(uploadFile.path)?.value,
          );

    final fileRef = FirebaseStorage.instance.ref(uploadPath);
    await fileRef.putData(bytes, metadata);
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
