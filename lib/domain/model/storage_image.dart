import 'package:freezed_annotation/freezed_annotation.dart';

part 'storage_image.freezed.dart';
part 'storage_image.g.dart';

@freezed
class StorageImage with _$StorageImage {
  const factory StorageImage({
    required String imageId,
    required String url,
  }) = _StorageImage;

  factory StorageImage.fromJson(Map<String, Object?> json) =>
      _$StorageImageFromJson(json);
}
