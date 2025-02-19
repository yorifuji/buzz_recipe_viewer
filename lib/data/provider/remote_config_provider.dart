import 'package:buzz_recipe_viewer/domain/model/remote_config_settings.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'remote_config_provider.g.dart';

@riverpod
class BoolRemoteConfig extends _$BoolRemoteConfig {
  @override
  bool build(RemoteConfigSetting<bool> remoteConfigSetting) {
    final remoteConfig = FirebaseRemoteConfig.instance;
    if (!kIsWeb) {
      final subscription = remoteConfig.onConfigUpdated.listen((event) async {
        await remoteConfig.activate();
        state = remoteConfig.getBool(remoteConfigSetting.key);
      });
      ref.onDispose(subscription.cancel);
    }
    return remoteConfig.getBool(remoteConfigSetting.key);
  }
}
