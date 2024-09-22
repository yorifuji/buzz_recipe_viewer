import 'package:buzz_recipe_viewer/provider/preference_provider.dart';
import 'package:buzz_recipe_viewer/provider/shared_preferences_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'preference_service.g.dart';

@riverpod
PreferenceService preferenceService(PreferenceServiceRef ref) =>
    PreferenceService(ref);

class PreferenceService {
  PreferenceService(this._ref);
  final PreferenceServiceRef _ref;

  Future<void> clearAll() async {
    await _ref.read(sharedPreferencesProvider).clear();
    _ref
      ..invalidate(boolPreferenceProvider)
      ..invalidate(intPreferenceProvider)
      ..invalidate(stringPreferenceProvider);
  }
}
