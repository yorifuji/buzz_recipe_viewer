import 'package:buzz_recipe_viewer/i18n/strings.g.dart';
import 'package:flutter/material.dart';

enum ImagePickerMenu {
  camera(Icon(Icons.camera)),
  gallery(Icon(Icons.photo)),
  ;

  const ImagePickerMenu(this.icon);
  final Widget icon;

  String get title => switch (this) {
        ImagePickerMenu.camera => t.imagePicker.takePhoto,
        ImagePickerMenu.gallery => t.imagePicker.chooseFromLibrary,
      };
}

Future<ImagePickerMenu?> showImagePickerBottomSheet(BuildContext context) =>
    showModalBottomSheet<ImagePickerMenu>(
      context: context,
      builder: (BuildContext context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: ImagePickerMenu.values
              .map(
                (e) => ListTile(
                  leading: e.icon,
                  title: Text(e.title),
                  onTap: () => Navigator.of(context).pop(e),
                ),
              )
              .toList(),
        ),
      ),
    );
