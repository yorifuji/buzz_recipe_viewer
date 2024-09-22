import 'package:buzz_recipe_viewer/i18n/strings.g.dart';
import 'package:flutter/material.dart';

class MaintenancePage extends StatelessWidget {
  const MaintenancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.build, size: 80),
            const SizedBox(height: 20),
            Text(t.maintenance.body, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
