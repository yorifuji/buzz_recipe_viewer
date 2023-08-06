import 'package:buzz_recipe_viewer/model/app_color.dart';
import 'package:buzz_recipe_viewer/repository/shared_preferences_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_color_preference_provider.g.dart';

@riverpod
AppColor appColorPreference(AppColorPreferenceRef ref) {
  final sharedPreferences = ref.watch(sharedPreferencesRepositoryProvider);
  return sharedPreferences.getAppColor();
}
