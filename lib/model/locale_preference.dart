import 'dart:ui';

enum LocalePreference {
  system('システム設定を利用', ''),
  en('ENGLISH', 'en'),
  jp('日本語', 'ja'),
  ;

  const LocalePreference(this.title, this.languageCode);
  factory LocalePreference.fromIndex(int index) =>
      LocalePreference.values[index];

  final String title;
  final String languageCode;

  Locale? get toLocale => switch (this) {
        system => null,
        jp => const Locale('ja'),
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
