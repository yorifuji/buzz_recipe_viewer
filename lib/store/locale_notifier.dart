import 'package:buzz_recipe_viewer/i18n/strings.g.dart';
import 'package:buzz_recipe_viewer/model/locale_preference.dart';
import 'package:buzz_recipe_viewer/provider/preference_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'locale_notifier.g.dart';

@riverpod
class LocaleNotifer extends _$LocaleNotifer {
  @override
  Future<LocalePreference> build() async {
    final index = ref.watch(intPreferenceProvider(Preference.locale));
    final localePreference = LocalePreference.fromIndex(index);
    await _applyLocaleSettings(localePreference);
    return localePreference;
  }

  Future<void> updateLocale(LocalePreference localePreference) async {
    await ref
        .read(intPreferenceProvider(Preference.locale).notifier)
        .update(localePreference.index);
    await _applyLocaleSettings(localePreference);
    ref.invalidateSelf();
  }

  Future<void> _applyLocaleSettings(LocalePreference localePreference) async {
    switch (localePreference) {
      case LocalePreference.system:
        await LocaleSettings.useDeviceLocale();
      case LocalePreference.en:
      case LocalePreference.ja:
        await LocaleSettings.setLocaleRaw(localePreference.languageCode);
    }
  }
}
