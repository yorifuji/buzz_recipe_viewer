// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'dart:ui_web';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class HtmlImageWidget extends HookWidget {
  const HtmlImageWidget({
    required this.imageUrl,
    super.key,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    useEffect(
      () {
        final viewType = 'html-image-${imageUrl.hashCode}';
        // ViewTypeを登録済みかどうかを確認する方法が変更されたため、try-catchを使用
        try {
          PlatformViewRegistry().registerViewFactory(
            viewType,
            (int viewId) => html.ImageElement()
              ..src = imageUrl
              ..style.width = '100%'
              ..style.height = '100%'
              ..style.objectFit = 'cover'
              ..style.objectPosition = 'center center'
              ..style.display = 'block'
              ..alt = 'Image',
          );
        } catch (e) {
          // viewTypeが既に登録されている場合、例外が発生するため無視
        }
        return null;
      },
      [imageUrl],
    );

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return SizedBox(
          width: constraints.maxWidth > 0 ? constraints.maxWidth : null,
          height: constraints.maxHeight > 0 ? constraints.maxHeight : null,
          child: HtmlElementView(
            viewType: 'html-image-${imageUrl.hashCode}',
          ),
        );
      },
    );
  }
}
