// sealed classを使ってImageSource　classを作成
// ImageSourceはImageSourceTypeを持ち、ImageSourceTypeは以下のいずれか
// network, file, html(blob)
// それぞれのImageSourceには、ImageSourceTypeに応じたプロパティを持つ

import 'dart:io';

import 'package:cross_file/cross_file.dart';
import 'package:flutter/material.dart';

sealed class ImageSource {
  const ImageSource();
  String get url;
  ImageProvider get imageProvider;
}

class NetworkImageSource extends ImageSource {
  const NetworkImageSource(this.imageUrl);
  final String imageUrl;

  @override
  String get url => imageUrl;

  @override
  ImageProvider<Object> get imageProvider => NetworkImage(imageUrl);
}

class FileImageSource extends ImageSource {
  const FileImageSource(this.xFile);
  final XFile xFile;

  @override
  String get url => xFile.path;

  @override
  ImageProvider<Object> get imageProvider => FileImage(File(xFile.path));
}
