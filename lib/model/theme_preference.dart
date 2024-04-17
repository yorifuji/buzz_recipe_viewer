import 'package:flutter/material.dart';

enum ThemePreference {
  system('システム', ThemeMode.system),
  light('ライト', ThemeMode.light),
  dark('ダーク', ThemeMode.dark);

  const ThemePreference(this.title, this.themeMode);

  factory ThemePreference.fromIndex(int index) => ThemePreference.values[index];

  final String title;
  final ThemeMode themeMode;
}
