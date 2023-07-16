import 'package:buzz_recipe_viewer/repository/shared_preferences_repository.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_selector_provider.g.dart';

@riverpod
class ThemeSelector extends _$ThemeSelector {
  static const _seedColor = Colors.orange;

  @override
  ThemeMode build() {
    return ref
        .watch(sharedPreferencesRepositoryProvider)
        .getThemeModePreference()
        .themeMode;
  }

  ThemeData lightTheme() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorSchemeSeed: _seedColor,
    );
  }

  ThemeData darkTheme() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorSchemeSeed: _seedColor,
    );
  }
}
