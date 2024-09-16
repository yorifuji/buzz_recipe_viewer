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

  factory ContentType.fromPath(String filePath) {
    final ext = extension(filePath).toLowerCase().replaceAll('.', '');
    return ContentType.values.firstWhere(
      (type) => type.extensions.contains(ext),
      orElse: () => throw UnsupportedError(
        'Unsupported file extension: $ext',
      ),
    );
  }

  final String value;
  final List<String> extensions;
}
