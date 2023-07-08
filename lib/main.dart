import 'package:buzz_recipe_viewer/model/favorite.dart';
import 'package:buzz_recipe_viewer/model/history.dart';
import 'package:buzz_recipe_viewer/provider/isar_provider.dart';
import 'package:buzz_recipe_viewer/provider/package_info_provider.dart';
import 'package:buzz_recipe_viewer/provider/shared_preferences_provider.dart';
import 'package:buzz_recipe_viewer/ui/navigation/navigation_bar_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // dotenv
  await dotenv.load();
  // Isar
  final dir = await getApplicationDocumentsDirectory();
  final isar =
      await Isar.open([HistorySchema, FavoriteSchema], directory: dir.path);
  // PackageInfo
  final packageInfo = await PackageInfo.fromPlatform();
  // SharedPreferences
  final sharedPreferences = await SharedPreferences.getInstance();

  runApp(
    ProviderScope(
      overrides: [
        isarProvider.overrideWithValue(isar),
        packageInfoProvider.overrideWithValue(packageInfo),
        sharedPreferencesProvider.overrideWithValue(sharedPreferences),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'レシピ検索',
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorSchemeSeed: Colors.indigo,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorSchemeSeed: Colors.indigo,
      ),
      home: const NavigationBarPage(),
    );
  }
}
