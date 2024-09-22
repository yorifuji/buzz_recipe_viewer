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
  const NetworkImageSource(this.url);
  @override
  final String url;

  @override
  ImageProvider<Object> get imageProvider => NetworkImage(url);
}

class FileImageSource extends ImageSource {
  FileImageSource(this.file);
  final XFile file;

  @override
  String get url => file.path;

  @override
  ImageProvider<Object> get imageProvider => FileImage(File(file.path));
}
