import 'package:flutter/material.dart';

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
