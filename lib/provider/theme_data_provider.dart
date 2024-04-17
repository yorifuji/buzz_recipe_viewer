import 'package:buzz_recipe_viewer/gen/fonts.gen.dart';
import 'package:buzz_recipe_viewer/store/app_color_notifier.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_data_provider.g.dart';

@riverpod
ThemeData themeData(ThemeDataRef ref, {bool isDarkMode = false}) {
  return ThemeData(
    useMaterial3: true,
    brightness: isDarkMode ? Brightness.dark : Brightness.light,
    colorSchemeSeed: ref.watch(appColorNotiferProvider).color,
    fontFamily: FontFamily.notoSansJP,
  );
}
