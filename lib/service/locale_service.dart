import 'package:buzz_recipe_viewer/model/locale_preference.dart';
import 'package:buzz_recipe_viewer/provider/locale_preference_provider.dart';
import 'package:buzz_recipe_viewer/repository/shared_preferences_repository.dart';
import 'package:flutter/widgets.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'locale_service.g.dart';

@riverpod
LocaleService localeService(LocaleServiceRef ref) =>
    LocaleService(ref, ref.watch(sharedPreferencesRepositoryProvider));

class LocaleService {
  LocaleService(this._ref, this._sharedPreferencesRepository);
  final LocaleServiceRef _ref;
  final SharedPreferencesRepository _sharedPreferencesRepository;

  Future<void> setLocale(LocalePreference localePreference) async {
    await _sharedPreferencesRepository.setLocalePreference(localePreference);
    _ref.invalidate(localePreferenceProvider);
    await WidgetsFlutterBinding.ensureInitialized().performReassemble();
  }
}
