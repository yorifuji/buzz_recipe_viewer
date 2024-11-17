import 'package:flutter/material.dart';

enum ThemePreference {
  system(ThemeMode.system),
  light(ThemeMode.light),
  dark(ThemeMode.dark);

  const ThemePreference(this.themeMode);

  factory ThemePreference.fromIndex(int index) => ThemePreference.values[index];
  final ThemeMode themeMode;
}
