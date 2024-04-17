import 'package:buzz_recipe_viewer/model/theme_mode_preference.dart';
import 'package:buzz_recipe_viewer/repository/preference_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_mode_notifier.g.dart';

@riverpod
class ThemeModeNotifer extends _$ThemeModeNotifer {
  @override
  ThemeModePreference build() {
    final index = ref.watch(intPreferenceProvider(IntKey.themeMode));
    return ThemeModePreference.fromIndex(index);
  }

  Future<void> update(ThemeModePreference themeModePreference) async {
    await ref
        .read(intPreferenceProvider(IntKey.themeMode).notifier)
        .update(themeModePreference.index);
    ref.invalidateSelf();
  }
}
