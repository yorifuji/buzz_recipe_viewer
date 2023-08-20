import 'package:buzz_recipe_viewer/app.dart';
import 'package:buzz_recipe_viewer/model/isar/favorite.dart';
import 'package:buzz_recipe_viewer/model/isar/history.dart';
import 'package:buzz_recipe_viewer/model/isar/recipe_note.dart';
import 'package:buzz_recipe_viewer/provider/is_first_run_provider.dart';
import 'package:buzz_recipe_viewer/provider/isar_provider.dart';
import 'package:buzz_recipe_viewer/provider/package_info_provider.dart';
import 'package:buzz_recipe_viewer/provider/shared_preferences_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final (_, isar, packageInfo, sharedPreferences) = await (
    // dotenv
    dotenv.load(),
    // Isar
    Isar.open(
      [HistorySchema, FavoriteSchema, RecipeNoteSchema],
      directory: (await getApplicationDocumentsDirectory()).path,
    ),
    // PackageInfo
    PackageInfo.fromPlatform(),
    // SharedPreferences
    SharedPreferences.getInstance()
  ).wait;

  // 初回起動かどうか（未使用）
  final isFirstRun = await isar.getSize() == 0;

  runApp(
    ProviderScope(
      overrides: [
        isarProvider.overrideWithValue(isar),
        isFirstRunProvider.overrideWithValue(isFirstRun),
        packageInfoProvider.overrideWithValue(packageInfo),
        sharedPreferencesProvider.overrideWithValue(sharedPreferences),
      ],
      child: const App(),
    ),
  );
}
