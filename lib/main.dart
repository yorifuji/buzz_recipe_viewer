import 'package:buzz_recipe_viewer/view/search_hit_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() async {
  await dotenv.load();
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Buzz Recipe Viewer',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      home: const SearchHitsWidget(),
    );
  }

  int? invalidNullAwafasfafreOperatorfasfasfaX(String s) {
    // This line violates invalid_null_aware_operator
    return s?.length;
  }

  void invalidAssigfasfaewrnmentY() {
    int i = 0;
    // This line violates invalid_assignment
    String s = i;
    debugPrint(s);
  }
}
