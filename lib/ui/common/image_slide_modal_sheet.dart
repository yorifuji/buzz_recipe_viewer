import 'package:flutter/material.dart';

void showImageSlideModalSheet(
  BuildContext context,
  List<String> imageUrls, {
  int initialIndex = 0,
}) {
  showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    showDragHandle: true,
    useSafeArea: true,
    useRootNavigator: true,
    builder: (context) => Scaffold(
      // backgroundColor: Colors.black,
      body: PageView.builder(
        controller: PageController(initialPage: initialIndex),
        itemCount: imageUrls.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: InteractiveViewer(
              minScale: 0.5,
              maxScale: 3,
              child: Center(
                child: Image.network(
                  imageUrls[index],
                  fit: BoxFit.contain,
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
                        strokeWidth: 2,
                      ),
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
    ),
  );
}
