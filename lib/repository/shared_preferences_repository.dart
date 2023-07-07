import 'package:buzz_recipe_viewer/provider/shared_preferences_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPreferencesRepositoryProvider =
    Provider<SharedPreferencesRepository>(
  (ref) => SharedPreferencesRepository(ref.watch(sharedPreferencesProvider)),
);

class SharedPreferencesRepository {
  SharedPreferencesRepository(this._sharedPreferences);

  final SharedPreferences _sharedPreferences;

  static const _useInternalPlayerKey = 'use_internal_player';

  bool getUseInternalPlayer() {
    return _sharedPreferences.getBool(_useInternalPlayerKey) ??
        true; // デフォルトは内部再生
  }

  void setUseInternalPlayer({required bool useInternalPlayer}) {
    _sharedPreferences.setBool(_useInternalPlayerKey, useInternalPlayer);
  }
}
