import 'package:buzz_recipe_viewer/ui/common/photo_slide_widget/photo_slide_state.dart';
import 'package:cross_file/cross_file.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class PhotoSlideController extends ValueNotifier<PhotoSlideState> {
  PhotoSlideController({List<String> initialUrls = const []})
      : super(PhotoSlideState.fromUrl(initialUrls));

  void addNewFile(XFile file) => value = value.addFile(file);

  void addNewFiles(List<XFile> files) => value = value.addFiles(files);

  void removeItem(int index) => value = value.removeItem(index);

  void clear() => value = const PhotoSlideState();
}

PhotoSlideController usePhotoSlideController({
  List<String> initialUrls = const [],
}) {
  final controller =
      useMemoized(() => PhotoSlideController(initialUrls: initialUrls), []);
  useEffect(() => controller.dispose, [controller]);
  return controller;
}
