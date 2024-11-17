import 'package:buzz_recipe_viewer/app.dart';
import 'package:buzz_recipe_viewer/data/provider/firebase_messaging_token_provider.dart';
import 'package:buzz_recipe_viewer/data/provider/package_info_provider.dart';
import 'package:buzz_recipe_viewer/data/provider/shared_preferences_provider.dart';
import 'package:buzz_recipe_viewer/domain/model/remote_config_settings.dart';
import 'package:buzz_recipe_viewer/firebase_options.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';
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

  // Firebase Analytics
  await FirebaseAnalytics.instance.logAppOpen();

  // Firebase Remote Config
  final remoteConfig = FirebaseRemoteConfig.instance;
  await remoteConfig.setDefaults(RemoteConfigSetting.allKeyAndDefaults());
  await remoteConfig.setConfigSettings(
    RemoteConfigSettings(
      fetchTimeout: const Duration(minutes: 1),
      minimumFetchInterval:
          kDebugMode ? const Duration(minutes: 3) : const Duration(hours: 12),
    ),
  );
  await remoteConfig.fetchAndActivate();

  runApp(
    ProviderScope(
      overrides: [
        packageInfoProvider.overrideWithValue(packageInfo),
        sharedPreferencesProvider.overrideWithValue(sharedPreferences),
        firebaseMessagingTokenProvider.overrideWithValue(null),
      ],
      child: const App(),
    ),
  );
}
