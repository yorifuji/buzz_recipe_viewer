import 'package:buzz_recipe_viewer/model/app_color.dart';
import 'package:buzz_recipe_viewer/provider/app_color_preference_provider.dart';
import 'package:buzz_recipe_viewer/repository/shared_preferences_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_color_service.g.dart';

@riverpod
AppColorService appColorService(AppColorServiceRef ref) =>
    AppColorService(ref, ref.watch(sharedPreferencesRepositoryProvider));

class AppColorService {
  AppColorService(this._ref, this._sharedPreferencesRepository);
  final AppColorServiceRef _ref;
  final SharedPreferencesRepository _sharedPreferencesRepository;

  Future<void> setAppColor(AppColor appColor) async {
    await _sharedPreferencesRepository.setAppColor(appColor);
    _ref.invalidate(appColorPreferenceProvider);
  }
}
