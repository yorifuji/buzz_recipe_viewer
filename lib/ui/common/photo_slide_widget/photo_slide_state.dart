import 'package:buzz_recipe_viewer/ui/common/photo_slide_widget/image_source.dart';
import 'package:cross_file/cross_file.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'photo_slide_state.freezed.dart';

@freezed
abstract class PhotoSlideState with _$PhotoSlideState {
  const factory PhotoSlideState({
    @Default([]) List<ImageSource> imageSources,
  }) = _PhotoSlideState;
  const PhotoSlideState._();

  // urlのリストを受け取るfactory constructorを作成
  factory PhotoSlideState.fromUrl(List<String> urls) => PhotoSlideState(
        imageSources: urls.map(NetworkImageSource.new).toList(),
      );

  factory PhotoSlideState.fromFile(List<XFile> files) => PhotoSlideState(
        imageSources: files.map(FileImageSource.new).toList(),
      );

  // add file
  PhotoSlideState addFile(XFile file) => PhotoSlideState(
        imageSources: [...imageSources, FileImageSource(file)],
      );

  // add files
  PhotoSlideState addFiles(List<XFile> files) => PhotoSlideState(
        imageSources: [...imageSources, ...files.map(FileImageSource.new)],
      );

  // remove item
  PhotoSlideState removeItem(int index) => PhotoSlideState(
        imageSources: [
          ...imageSources.sublist(0, index),
          ...imageSources.sublist(index + 1),
        ],
      );

  // get path at index
  String getPathAtIndex(int index) => imageSources[index].url;

  // get files
  List<XFile> get files =>
      imageSources.whereType<FileImageSource>().map((e) => e.xFile).toList();

  // get urls
  List<String> get urls => imageSources
      .whereType<NetworkImageSource>()
      .map((e) => e.imageUrl)
      .toList();

  int get totalCount => imageSources.length;

  ImageProvider getImageProviderAtIndex(int index) =>
      imageSources[index].imageProvider;
}
