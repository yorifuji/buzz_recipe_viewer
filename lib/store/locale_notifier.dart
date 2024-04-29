import 'package:buzz_recipe_viewer/i18n/strings.g.dart';
import 'package:buzz_recipe_viewer/model/locale_preference.dart';
import 'package:buzz_recipe_viewer/repository/preference_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'locale_notifier.g.dart';

@riverpod
class LocaleNotifer extends _$LocaleNotifer {
  @override
  LocalePreference build() {
    final index = ref.watch(preferenceNotifierProvider(Preference.locale));
    final localePreference = LocalePreference.fromIndex(index);
    _applyLocaleSettings(localePreference);
    return localePreference;
  }

  Future<void> update(LocalePreference localePreference) async {
    await ref
        .read(preferenceNotifierProvider(Preference.locale).notifier)
        .update(localePreference.index);
    ref.invalidateSelf();
  }

  void _applyLocaleSettings(LocalePreference localePreference) {
    switch (localePreference) {
      case LocalePreference.system:
        LocaleSettings.useDeviceLocale();
      case LocalePreference.en:
      case LocalePreference.ja:
        LocaleSettings.setLocaleRaw(localePreference.languageCode);
    }
  }
}
