import 'package:buzz_recipe_viewer/data/model/storage_exception.dart';
import 'package:buzz_recipe_viewer/i18n/strings.g.dart';

extension AuthExceptionReason on StorageException {
  String get message => switch (this) {
        StorageException.unknown => t.error.storage.unknown,
        StorageException.objectNotFound => t.error.storage.objectNotFound,
        StorageException.bucketNotFound => t.error.storage.bucketNotFound,
        StorageException.projectNotFound => t.error.storage.projectNotFound,
        StorageException.quotaExceeded => t.error.storage.quotaExceeded,
        StorageException.unauthenticated => t.error.storage.unauthenticated,
        StorageException.unauthorized => t.error.storage.unauthorized,
        StorageException.retryLimitExceeded =>
          t.error.storage.retryLimitExceeded,
        StorageException.invalidChecksum => t.error.storage.invalidChecksum,
        StorageException.canceled => t.error.storage.canceled,
        StorageException.invalidEventName => t.error.storage.invalidEventName,
        StorageException.invalidUrl => t.error.storage.invalidUrl,
        StorageException.invalidArgument => t.error.storage.invalidArgument,
        StorageException.noDefaultBucket => t.error.storage.noDefaultBucket,
        StorageException.cannotSliceBlob => t.error.storage.cannotSliceBlob,
        StorageException.serverFileWrongSize =>
          t.error.storage.serverFileWrongSize,
      };
}
