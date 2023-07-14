import 'package:buzz_recipe_viewer/provider/shared_preferences_provider.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'shared_preferences_repository.g.dart';

enum ThemeModePreference {
  system('システム', ThemeMode.system),
  light('ライト', ThemeMode.light),
  dark('ダーク', ThemeMode.dark);

  const ThemeModePreference(this.title, this.themeMode);

  factory ThemeModePreference.fromIndex(int index) =>
      ThemeModePreference.values[index];

  final String title;
  final ThemeMode themeMode;
}

@riverpod
SharedPreferencesRepository sharedPreferencesRepository(
  SharedPreferencesRepositoryRef ref,
) {
  return SharedPreferencesRepository(ref.watch(sharedPreferencesProvider));
}

class SharedPreferencesRepository {
  SharedPreferencesRepository(this._sharedPreferences);

  final SharedPreferences _sharedPreferences;

  static const _useInternalPlayerKey = 'use_internal_player';

  bool getUseInternalPlayer() {
    return _sharedPreferences.getBool(_useInternalPlayerKey) ??
        true; // デフォルトは内部再生
  }

  Future<void> setUseInternalPlayer({required bool useInternalPlayer}) async {
    await _sharedPreferences.setBool(_useInternalPlayerKey, useInternalPlayer);
  }

  ThemeModePreference getThemeModePreference() {
    final index = _sharedPreferences.getInt('theme_mode') ?? 0;
    return ThemeModePreference.fromIndex(index);
  }

  Future<void> setThemeModePreference(
    ThemeModePreference themeModePreference,
  ) async {
    await _sharedPreferences.setInt('theme_mode', themeModePreference.index);
  }
}
