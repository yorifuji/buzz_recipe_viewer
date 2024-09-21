import 'package:buzz_recipe_viewer/i18n/strings.g.dart';
import 'package:buzz_recipe_viewer/ui/common/photo_slide_widget/html_image.dart';
import 'package:buzz_recipe_viewer/ui/common/photo_slide_widget/photo_slide_controller.dart';
import 'package:buzz_recipe_viewer/ui/common/photo_slide_widget/photo_slide_state.dart';
import 'package:cross_file/cross_file.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class PhotoSlideWidget extends HookWidget {
  const PhotoSlideWidget({
    super.key,
    this.urls,
    this.onTapImage,
    this.onTapPickImage,
    this.onTapPickImages,
    this.controller,
  })  : assert(
          (controller != null) ^ (urls != null),
          'Either controller or urls must be provided, but not both',
        ),
        assert(
          (controller == null &&
                  onTapPickImage == null &&
                  onTapPickImages == null) ||
              controller != null &&
                  ((onTapPickImage != null) ^ (onTapPickImages != null)),
          'onTapPickImage and onTapPickImages must be provided only when controller is provided',
        ),
        assert(
          controller == null || onTapImage == null,
          'onTapImage must be provided only when controller is not provided',
        );

  final List<String>? urls;
  final void Function(int index)? onTapImage;
  final Future<XFile?> Function()? onTapPickImage;
  final Future<List<XFile>?> Function()? onTapPickImages;
  final PhotoSlideController? controller;

  bool get _isEditable => controller != null;

  @override
  Widget build(BuildContext context) {
    final state = _isEditable
        ? useValueListenable(controller!)
        : PhotoSlideState(urls: urls ?? []);

    return PageView.builder(
      controller: PageController(viewportFraction: 0.85),
      itemCount: state.totalCount + (_isEditable ? 1 : 0),
      itemBuilder: (context, index) => _buildItem(state, index),
    );
  }

  Widget _buildItem(PhotoSlideState state, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: index == state.totalCount && _isEditable
          ? _buildAddPhotoWidget()
          : _buildPhotoWidget(state, index),
    );
  }

  Widget _buildAddPhotoWidget() {
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(child: Text(t.imagePicker.noImageSelected)),
      ),
      onTap: () async {
        if (onTapPickImages != null) {
          final pickedImages = await onTapPickImages?.call();
          if (pickedImages != null) {
            controller?.addNewFiles(pickedImages);
          }
        } else {
          final pickedImages = await onTapPickImages?.call();
          if (pickedImages != null) {
            controller?.addNewFiles(pickedImages);
          }
        }
      },
    );
  }

  Widget _buildPhotoWidget(PhotoSlideState state, int index) {
    final stack = Stack(
      children: [
        Positioned.fill(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: kIsWeb
                ? HtmlImageWidget(imageUrl: state.getPathAtIndex(index))
                : Image(
                    image: state.getImageProviderAtIndex(index),
                    fit: BoxFit.cover,
                    loadingBuilder: (
                      BuildContext context,
                      Widget child,
                      ImageChunkEvent? loadingProgress,
                    ) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      );
                    },
                  ),
          ),
        ),
        if (_isEditable)
          Positioned(
            right: 0,
            bottom: 0,
            child: IconButton(
              icon: const Icon(Icons.delete, color: Colors.white),
              onPressed: () => controller?.removeItem(index),
            ),
          ),
      ],
    );

    return onTapImage != null
        ? InkWell(
            child: stack,
            onTap: () => onTapImage?.call(index),
          )
        : stack;
  }
}
