import 'package:buzz_recipe_viewer/gen/fonts.gen.dart';
import 'package:buzz_recipe_viewer/model/complementary_color.dart';
import 'package:buzz_recipe_viewer/store/app_color_notifier.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_data_provider.g.dart';

@riverpod
ThemeData themeData(Ref ref, {bool isDarkMode = false}) {
  final themeData = ThemeData(
    useMaterial3: true,
    brightness: isDarkMode ? Brightness.dark : Brightness.light,
    colorSchemeSeed: ref.watch(appColorNotiferProvider).color,
    fontFamily: FontFamily.notoSansJP,
  );
  return themeData.copyWith(
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      foregroundColor: themeData.colorScheme.onSecondary.complementary,
      backgroundColor: themeData.colorScheme.secondary.complementary,
    ),
  );
}
