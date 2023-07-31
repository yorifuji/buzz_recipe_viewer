import 'package:buzz_recipe_viewer/repository/shared_preferences_repository.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_mode_preference_provider.g.dart';

@riverpod
ThemeMode themeModePreference(ThemeModePreferenceRef ref) {
  final sharedPreferences = ref.watch(sharedPreferencesRepositoryProvider);
  return sharedPreferences.getThemeModePreference().themeMode;
}
