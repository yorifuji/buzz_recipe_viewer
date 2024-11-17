import 'package:collection/collection.dart';
import 'package:path/path.dart';

enum ContentType {
  jpeg('image/jpeg', ['jpg', 'jpeg']),
  png('image/png', ['png']),
  gif('image/gif', ['gif']),
  webp('image/webp', ['webp']),
  bmp('image/bmp', ['bmp']),
  tiff('image/tiff', ['tiff', 'tif']),
  svg('image/svg+xml', ['svg']),
  heic('image/heic', ['heic']),
  heif('image/heif', ['heif']),
  raw('image/x-raw', ['raw']),
  ico('image/x-icon', ['ico']);

  const ContentType(this.value, this.extensions);

  static ContentType? fromPath(String filePath) {
    final ext = extension(filePath).toLowerCase().replaceAll('.', '');
    return ContentType.values
        .firstWhereOrNull((type) => type.extensions.contains(ext));
  }

  final String value;
  final List<String> extensions;
}
