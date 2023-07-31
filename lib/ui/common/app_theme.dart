// ignore_for_file: avoid_classes_with_only_static_members

import 'package:flutter/material.dart';

class AppTheme {
  static const _seedColor = Colors.orange;
  static ThemeData light() => ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorSchemeSeed: _seedColor,
      );

  static ThemeData dark() => ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorSchemeSeed: _seedColor,
      );
}
