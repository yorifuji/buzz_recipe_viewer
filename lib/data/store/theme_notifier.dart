import 'package:buzz_recipe_viewer/data/provider/preference_provider.dart';
import 'package:buzz_recipe_viewer/domain/model/theme_preference.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_notifier.g.dart';

@riverpod
class ThemeNotifer extends _$ThemeNotifer {
  @override
  ThemePreference build() {
    final index = ref.watch(intPreferenceProvider(Preference.themeMode));
    return ThemePreference.fromIndex(index);
  }

  Future<void> update(ThemePreference themeModePreference) async {
    await ref
        .read(intPreferenceProvider(Preference.themeMode).notifier)
        .update(themeModePreference.index);
    ref.invalidateSelf();
  }
}
