import 'package:buzz_recipe_viewer/model/content_type.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ContentType', () {
    test('should return correct ContentType for supported extensions', () {
      expect(ContentType.fromPath('image.jpg'), ContentType.jpeg);
      expect(ContentType.fromPath('image.jpeg'), ContentType.jpeg);
      expect(ContentType.fromPath('image.png'), ContentType.png);
      expect(ContentType.fromPath('image.gif'), ContentType.gif);
      expect(ContentType.fromPath('image.webp'), ContentType.webp);
      expect(ContentType.fromPath('image.bmp'), ContentType.bmp);
      expect(ContentType.fromPath('image.tiff'), ContentType.tiff);
      expect(ContentType.fromPath('image.tif'), ContentType.tiff);
      expect(ContentType.fromPath('image.svg'), ContentType.svg);
      expect(ContentType.fromPath('image.heic'), ContentType.heic);
      expect(ContentType.fromPath('image.heif'), ContentType.heif);
      expect(ContentType.fromPath('image.raw'), ContentType.raw);
      expect(ContentType.fromPath('image.ico'), ContentType.ico);
    });

    test('should throw UnsupportedError for unsupported extensions', () {
      expect(
        () => ContentType.fromPath('image.txt'),
        throwsUnsupportedError,
      );
      expect(
        () => ContentType.fromPath('image.doc'),
        throwsUnsupportedError,
      );
      expect(
        () => ContentType.fromPath('image.pdf'),
        throwsUnsupportedError,
      );
    });

    test('should handle case insensitivity in file extensions', () {
      expect(ContentType.fromPath('image.JPG'), ContentType.jpeg);
      expect(ContentType.fromPath('image.JPEG'), ContentType.jpeg);
      expect(ContentType.fromPath('image.PNG'), ContentType.png);
      expect(ContentType.fromPath('image.GIF'), ContentType.gif);
      expect(ContentType.fromPath('image.WEBP'), ContentType.webp);
      expect(ContentType.fromPath('image.BMP'), ContentType.bmp);
      expect(ContentType.fromPath('image.TIFF'), ContentType.tiff);
      expect(ContentType.fromPath('image.TIF'), ContentType.tiff);
      expect(ContentType.fromPath('image.SVG'), ContentType.svg);
      expect(ContentType.fromPath('image.HEIC'), ContentType.heic);
      expect(ContentType.fromPath('image.HEIF'), ContentType.heif);
      expect(ContentType.fromPath('image.RAW'), ContentType.raw);
      expect(ContentType.fromPath('image.ICO'), ContentType.ico);
    });
  });
}
