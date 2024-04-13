import 'dart:async';
import 'package:buzz_recipe_viewer/gen/assets.gen.dart';
import 'package:buzz_recipe_viewer/gen/fonts.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  return GoldenToolkit.runWithConfiguration(
    () async {
      await loadAppFonts();
      await testMain();
    },
    config: GoldenToolkitConfiguration(
      defaultDevices: const [Device.iphone11],
    ),
  );
}

final wrapper = materialAppWrapper(
  theme: ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorSchemeSeed: Colors.deepPurple,
    fontFamily: FontFamily.notoSansJP,
  ),
  localeOverrides: [const Locale('ja'), const Locale('en')],
  localizations: [
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ],
);
