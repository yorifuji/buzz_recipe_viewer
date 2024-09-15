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

class StorageImageListField
    implements JsonConverter<List<StorageImage>, List<dynamic>> {
  const StorageImageListField();

  @override
  List<StorageImage> fromJson(List<dynamic> json) {
    return json
        .map((e) => StorageImage.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  List<dynamic> toJson(List<StorageImage> imageList) {
    return imageList.map((image) => image.toJson()).toList();
  }
}
