import 'package:flutter/material.dart';

void showFullscreenImageDialog(
  BuildContext context,
  List<String> imageUrls, {
  int initialIndex = 0,
}) {
  showGeneralDialog(
    context: context,
    pageBuilder: (
      BuildContext buildContext,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
    ) {
      return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: PageView.builder(
            controller: PageController(initialPage: initialIndex),
            itemCount: imageUrls.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.of(buildContext).pop();
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
    },
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
  );
}
