import 'dart:ui';

enum LocalePreference {
  system(''),
  en('en'),
  ja('ja'),
  ;

  const LocalePreference(this.languageCode);
  factory LocalePreference.fromIndex(int index) =>
      LocalePreference.values[index];

  final String languageCode;

  Locale? get toLocale => switch (this) {
        system => null,
        ja => const Locale('ja'),
        en => const Locale('en'),
      };

  // get Supported Locale list
  static List<Locale> supportedLocaleList() {
    return LocalePreference.values
        .map((localePreference) => localePreference.toLocale)
        .whereType<Locale>()
        .toList();
  }
}
