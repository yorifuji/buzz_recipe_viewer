import 'package:buzz_recipe_viewer/ui/common/photo_slide_widget/photo_slide_state.dart';
import 'package:cross_file/cross_file.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class PhotoSlideController extends ValueNotifier<PhotoSlideState> {
  PhotoSlideController({List<String> initialUrls = const []})
      : super(PhotoSlideState(urls: initialUrls));

  void addNewFile(XFile file) {
    value = value.copyWith(files: [...value.files, file]);
  }

  void removeItem(int index) {
    if (value.isUrlAtIndex(index)) {
      value = value.copyWith(urls: [...value.urls]..removeAt(index));
    } else {
      value = value.copyWith(
        files: [...value.files]..removeAt(index - value.urls.length),
      );
    }
  }

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
