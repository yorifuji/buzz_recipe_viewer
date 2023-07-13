import 'package:buzz_recipe_viewer/repository/shared_preferences_repository.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_provider.g.dart';

@riverpod
class Theme extends _$Theme {
  static const seedColor = Colors.orange;

  late final SharedPreferencesRepository _sharedPreferencesRepository;

  @override
  ThemeMode build() {
    _sharedPreferencesRepository =
        ref.watch(sharedPreferencesRepositoryProvider);
    return _sharedPreferencesRepository.getThemeMode();
  }

  Future<void> changeAndSave(ThemeMode theme) async {
    await _sharedPreferencesRepository.setThemeMode(theme);
    state = theme;
  }

  static ThemeData lightTheme() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorSchemeSeed: seedColor,
    );
  }

  static ThemeData darkTheme() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorSchemeSeed: seedColor,
    );
  }
}
