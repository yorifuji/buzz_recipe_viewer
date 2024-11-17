import 'package:buzz_recipe_viewer/domain/model/content_type.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ContentType', () {
    test('fromPath は正しい ContentType を返す', () {
      expect(ContentType.fromPath('image.jpg'), ContentType.jpeg);
      expect(ContentType.fromPath('photo.png'), ContentType.png);
      expect(ContentType.fromPath('animation.gif'), ContentType.gif);
      expect(ContentType.fromPath('picture.webp'), ContentType.webp);
      expect(ContentType.fromPath('graphic.bmp'), ContentType.bmp);
      expect(ContentType.fromPath('image.tiff'), ContentType.tiff);
      expect(ContentType.fromPath('vector.svg'), ContentType.svg);
      expect(ContentType.fromPath('photo.heic'), ContentType.heic);
      expect(ContentType.fromPath('image.heif'), ContentType.heif);
      expect(ContentType.fromPath('photo.raw'), ContentType.raw);
      expect(ContentType.fromPath('icon.ico'), ContentType.ico);
    });

    test('大文字小文字を区別しない', () {
      expect(ContentType.fromPath('image.JPG'), ContentType.jpeg);
      expect(ContentType.fromPath('photo.PNG'), ContentType.png);
      expect(ContentType.fromPath('animation.GIF'), ContentType.gif);
      expect(ContentType.fromPath('icon.ICO'), ContentType.ico);
    });

    test('複数のドットを含むファイル名を処理できる', () {
      expect(ContentType.fromPath('image.backup.jpg'), ContentType.jpeg);
      expect(ContentType.fromPath('photo.2023.png'), ContentType.png);
      expect(ContentType.fromPath('icon.v2.ico'), ContentType.ico);
    });

    test('サポートされていない拡張子の場合は null を返す', () {
      expect(ContentType.fromPath('document.pdf'), isNull);
      expect(ContentType.fromPath('text.txt'), isNull);
      expect(ContentType.fromPath('spreadsheet.xlsx'), isNull);
    });

    test('拡張子のない場合は null を返す', () {
      expect(ContentType.fromPath('noextension'), isNull);
    });

    test('空文字の場合は null を返す', () {
      expect(ContentType.fromPath(''), isNull);
    });

    test('ドットのみの場合は null を返す', () {
      expect(ContentType.fromPath('.'), isNull);
      expect(ContentType.fromPath('..'), isNull);
    });
  });
}
