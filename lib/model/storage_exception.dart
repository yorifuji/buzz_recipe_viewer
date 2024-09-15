import 'package:firebase_auth/firebase_auth.dart';

// ref. https://github.com/firebase/flutterfire/blob/4e28103fafd84c6613df647e7f0dbb6a068ca8ea/docs/storage/handle-errors.md?plain=1#L46
enum StorageException implements Exception {
  unknown('storage/unknown'),
  objectNotFound('storage/object-not-found'),
  bucketNotFound('storage/bucket-not-found'),
  projectNotFound('storage/project-not-found'),
  quotaExceeded('storage/quota-exceeded'),
  unauthenticated('storage/unauthenticated'),
  unauthorized('storage/unauthorized'),
  retryLimitExceeded('storage/retry-limit-exceeded'),
  invalidChecksum('storage/invalid-checksum'),
  canceled('storage/canceled'),
  invalidEventName('storage/invalid-event-name'),
  invalidUrl('storage/invalid-url'),
  invalidArgument('storage/invalid-argument'),
  noDefaultBucket('storage/no-default-bucket'),
  cannotSliceBlob('storage/cannot-slice-blob'),
  serverFileWrongSize('storage/server-file-wrong-size'),
  ;

  const StorageException(this.code);
  factory StorageException.from(FirebaseException e) =>
      StorageException.values.firstWhere(
        (element) => element.code == e.code,
        orElse: () => StorageException.unknown,
      );

  final String code;
}
