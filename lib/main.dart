import 'package:buzz_recipe_viewer/app.dart';
import 'package:buzz_recipe_viewer/firebase_options.dart';
import 'package:buzz_recipe_viewer/provider/firebase_messaging_token_provider.dart';
import 'package:buzz_recipe_viewer/provider/package_info_provider.dart';
import 'package:buzz_recipe_viewer/provider/shared_preferences_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final (_, packageInfo, sharedPreferences, _) = await (
    dotenv.load(),
    PackageInfo.fromPlatform(),
    SharedPreferences.getInstance(),
    Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    )
  ).wait;

  // Get the token each time the application loads
  final token = await FirebaseMessaging.instance.getToken();

  // Request permission
  await FirebaseMessaging.instance.requestPermission();

  runApp(
    ProviderScope(
      overrides: [
        packageInfoProvider.overrideWithValue(packageInfo),
        sharedPreferencesProvider.overrideWithValue(sharedPreferences),
        firebaseMessagingTokenProvider.overrideWithValue(token),
      ],
      child: const App(),
    ),
  );
}
