import 'package:buzz_recipe_viewer/model/favorite.dart';
import 'package:buzz_recipe_viewer/model/history.dart';
import 'package:buzz_recipe_viewer/repository/database_repository.dart';
import 'package:buzz_recipe_viewer/ui/navigation_bar/navigation_bar_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  // const flavor = String.fromEnvironment('FLAVOR');
  // print(flavor); // dev
  await dotenv.load();

  final dir = await getApplicationDocumentsDirectory();
  final isar =
      await Isar.open([HistorySchema, FavoriteSchema], directory: dir.path);
  final database = DatabaseRepository(isar);

  runApp(
    ProviderScope(
      overrides: [
        databaseRepositoryProvider.overrideWithValue(database),
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
      title: 'Buzz Recipe Viewer',
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
