import 'package:buzz_recipe_viewer/provider/theme_mode_preference_provider.dart';
import 'package:buzz_recipe_viewer/repository/shared_preferences_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_service.g.dart';

@riverpod
ThemeService themeService(ThemeServiceRef ref) =>
    ThemeService(ref, ref.watch(sharedPreferencesRepositoryProvider));

class ThemeService {
  ThemeService(this._ref, this._sharedPreferencesRepository);
  final ThemeServiceRef _ref;
  final SharedPreferencesRepository _sharedPreferencesRepository;

  Future<void> setThemeModePreference(
    ThemeModePreference themeModePreference,
  ) async {
    await _sharedPreferencesRepository
        .setThemeModePreference(themeModePreference);
    _ref.invalidate(themeModePreferenceProvider);
  }
}
