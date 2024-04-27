import 'package:buzz_recipe_viewer/model/theme_preference.dart';
import 'package:buzz_recipe_viewer/repository/preference_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_notifier.g.dart';

@riverpod
class ThemeNotifer extends _$ThemeNotifer {
  @override
  ThemePreference build() {
    final index = ref.watch(intPreferenceProvider(PreferenceKey.themeMode));
    return ThemePreference.fromIndex(index);
  }

  Future<void> update(ThemePreference themeModePreference) async {
    await ref
        .read(intPreferenceProvider(PreferenceKey.themeMode).notifier)
        .update(themeModePreference.index);
    ref.invalidateSelf();
  }
}
