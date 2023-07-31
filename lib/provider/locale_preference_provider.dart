import 'dart:ui';

import 'package:buzz_recipe_viewer/repository/shared_preferences_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'locale_preference_provider.g.dart';

@riverpod
Locale? localePreference(LocalePreferenceRef ref) {
  final sharedPreferences = ref.watch(sharedPreferencesRepositoryProvider);
  return sharedPreferences.getLocalePreference().toLocale;
}
