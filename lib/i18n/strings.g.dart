/// Generated file. Do not edit.
///
/// Original: lib/i18n
/// To regenerate, run: `dart run slang`
///
/// Locales: 2
/// Strings: 142 (71 per locale)
///
/// Built on 2024-04-29 at 02:09 UTC

// coverage:ignore-file
// ignore_for_file: type=lint

import 'package:flutter/widgets.dart';
import 'package:slang/builder/model/node.dart';
import 'package:slang_flutter/slang_flutter.dart';
export 'package:slang_flutter/slang_flutter.dart';

const AppLocale _baseLocale = AppLocale.en;

/// Supported locales, see extension methods below.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.en) // set locale
/// - Locale locale = AppLocale.en.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.en) // locale check
enum AppLocale with BaseAppLocale<AppLocale, Translations> {
  en(languageCode: 'en', build: Translations.build),
  ja(languageCode: 'ja', build: _StringsJa.build);

  const AppLocale(
      {required this.languageCode,
      this.scriptCode,
      this.countryCode,
      required this.build}); // ignore: unused_element

  @override
  final String languageCode;
  @override
  final String? scriptCode;
  @override
  final String? countryCode;
  @override
  final TranslationBuilder<AppLocale, Translations> build;

  /// Gets current instance managed by [LocaleSettings].
  Translations get translations =>
      LocaleSettings.instance.translationMap[this]!;
}

/// Method A: Simple
///
/// No rebuild after locale change.
/// Translation happens during initialization of the widget (call of t).
/// Configurable via 'translate_var'.
///
/// Usage:
/// String a = t.someKey.anotherKey;
/// String b = t['someKey.anotherKey']; // Only for edge cases!
Translations get t => LocaleSettings.instance.currentTranslations;

/// Method B: Advanced
///
/// All widgets using this method will trigger a rebuild when locale changes.
/// Use this if you have e.g. a settings page where the user can select the locale during runtime.
///
/// Step 1:
/// wrap your App with
/// TranslationProvider(
/// 	child: MyApp()
/// );
///
/// Step 2:
/// final t = Translations.of(context); // Get t variable.
/// String a = t.someKey.anotherKey; // Use t variable.
/// String b = t['someKey.anotherKey']; // Only for edge cases!
class TranslationProvider
    extends BaseTranslationProvider<AppLocale, Translations> {
  TranslationProvider({required super.child})
      : super(settings: LocaleSettings.instance);

  static InheritedLocaleData<AppLocale, Translations> of(
          BuildContext context) =>
      InheritedLocaleData.of<AppLocale, Translations>(context);
}

/// Method B shorthand via [BuildContext] extension method.
/// Configurable via 'translate_var'.
///
/// Usage (e.g. in a widget's build method):
/// context.t.someKey.anotherKey
extension BuildContextTranslationsExtension on BuildContext {
  Translations get t => TranslationProvider.of(this).translations;
}

/// Manages all translation instances and the current locale
class LocaleSettings
    extends BaseFlutterLocaleSettings<AppLocale, Translations> {
  LocaleSettings._() : super(utils: AppLocaleUtils.instance);

  static final instance = LocaleSettings._();

  // static aliases (checkout base methods for documentation)
  static AppLocale get currentLocale => instance.currentLocale;
  static Stream<AppLocale> getLocaleStream() => instance.getLocaleStream();
  static AppLocale setLocale(AppLocale locale,
          {bool? listenToDeviceLocale = false}) =>
      instance.setLocale(locale, listenToDeviceLocale: listenToDeviceLocale);
  static AppLocale setLocaleRaw(String rawLocale,
          {bool? listenToDeviceLocale = false}) =>
      instance.setLocaleRaw(rawLocale,
          listenToDeviceLocale: listenToDeviceLocale);
  static AppLocale useDeviceLocale() => instance.useDeviceLocale();
  @Deprecated('Use [AppLocaleUtils.supportedLocales]')
  static List<Locale> get supportedLocales => instance.supportedLocales;
  @Deprecated('Use [AppLocaleUtils.supportedLocalesRaw]')
  static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
  static void setPluralResolver(
          {String? language,
          AppLocale? locale,
          PluralResolver? cardinalResolver,
          PluralResolver? ordinalResolver}) =>
      instance.setPluralResolver(
        language: language,
        locale: locale,
        cardinalResolver: cardinalResolver,
        ordinalResolver: ordinalResolver,
      );
}

/// Provides utility functions without any side effects.
class AppLocaleUtils extends BaseAppLocaleUtils<AppLocale, Translations> {
  AppLocaleUtils._()
      : super(baseLocale: _baseLocale, locales: AppLocale.values);

  static final instance = AppLocaleUtils._();

  // static aliases (checkout base methods for documentation)
  static AppLocale parse(String rawLocale) => instance.parse(rawLocale);
  static AppLocale parseLocaleParts(
          {required String languageCode,
          String? scriptCode,
          String? countryCode}) =>
      instance.parseLocaleParts(
          languageCode: languageCode,
          scriptCode: scriptCode,
          countryCode: countryCode);
  static AppLocale findDeviceLocale() => instance.findDeviceLocale();
  static List<Locale> get supportedLocales => instance.supportedLocales;
  static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
}

// translations

// Path: <root>
class Translations implements BaseTranslations<AppLocale, Translations> {
  /// Returns the current translations of the given [context].
  ///
  /// Usage:
  /// final t = Translations.of(context);
  static Translations of(BuildContext context) =>
      InheritedLocaleData.of<AppLocale, Translations>(context).translations;

  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  Translations.build(
      {Map<String, Node>? overrides,
      PluralResolver? cardinalResolver,
      PluralResolver? ordinalResolver})
      : assert(overrides == null,
            'Set "translation_overrides: true" in order to enable this feature.'),
        $meta = TranslationMetadata(
          locale: AppLocale.en,
          overrides: overrides ?? {},
          cardinalResolver: cardinalResolver,
          ordinalResolver: ordinalResolver,
        ) {
    $meta.setFlatMapFunction(_flatMapFunction);
  }

  /// Metadata for the translations of <en>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  /// Access flat map
  dynamic operator [](String key) => $meta.getTranslation(key);

  late final Translations _root = this; // ignore: unused_field

  // Translations
  String get appTitle => 'Awesome Japanese Recipe';
  late final _StringsTabEn tab = _StringsTabEn._(_root);
  late final _StringsWalkthroughEn walkthrough = _StringsWalkthroughEn._(_root);
  late final _StringsRecipeEn recipe = _StringsRecipeEn._(_root);
  late final _StringsVideoEn video = _StringsVideoEn._(_root);
  late final _StringsFavoriteEn favorite = _StringsFavoriteEn._(_root);
  late final _StringsSettingsEn settings = _StringsSettingsEn._(_root);
  late final _StringsCommonEn common = _StringsCommonEn._(_root);
}

// Path: tab
class _StringsTabEn {
  _StringsTabEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get recipe => 'Recipe';
  String get video => 'Video';
  String get favorite => 'Favorite';
  String get settings => 'Settings';
}

// Path: walkthrough
class _StringsWalkthroughEn {
  _StringsWalkthroughEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  late final _StringsWalkthroughIntro1En intro1 =
      _StringsWalkthroughIntro1En._(_root);
  late final _StringsWalkthroughIntro2En intro2 =
      _StringsWalkthroughIntro2En._(_root);
  String get skip => 'Skip';
  String get done => 'Done';
}

// Path: recipe
class _StringsRecipeEn {
  _StringsRecipeEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Recipe';
  String get empty => 'We\'ve got no recipes.\nAdd your best ones!';
  String get addRecipe => 'Add Recipe';
  late final _StringsRecipeNewRecipeEn newRecipe =
      _StringsRecipeNewRecipeEn._(_root);
  late final _StringsRecipeViewRecipeEn viewRecipe =
      _StringsRecipeViewRecipeEn._(_root);
}

// Path: video
class _StringsVideoEn {
  _StringsVideoEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Video';
}

// Path: favorite
class _StringsFavoriteEn {
  _StringsFavoriteEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Favorite';
  String get empty => 'Love a video?\nTap the heart to make it your fave!';
}

// Path: settings
class _StringsSettingsEn {
  _StringsSettingsEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Settings';
  late final _StringsSettingsGeneralEn general =
      _StringsSettingsGeneralEn._(_root);
  late final _StringsSettingsVideoEn video = _StringsSettingsVideoEn._(_root);
  late final _StringsSettingsSupportEn support =
      _StringsSettingsSupportEn._(_root);
  late final _StringsSettingsAboutEn about = _StringsSettingsAboutEn._(_root);
  late final _StringsSettingsDebugEn debug = _StringsSettingsDebugEn._(_root);
  String get selected => 'Selected';
}

// Path: common
class _StringsCommonEn {
  _StringsCommonEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get addFavorite => 'Add Favorite';
  String get fetchFailed => 'Failed to fetch data.';
  String get reload => 'Reload';
  String get searchEmpty => 'The search returned 0 results.';
  String get more => 'More';
  String get searchQuery => 'Search query';
  String get sortByDate => 'Sort by Date (Newest First)';
  String get sortByLikes => 'Popular (Likes)';
  String get sortByViews => 'Popular (Views)';
}

// Path: walkthrough.intro1
class _StringsWalkthroughIntro1En {
  _StringsWalkthroughIntro1En._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Make every day delicious';
  String get body => 'Let\'s create your own recipe book';
}

// Path: walkthrough.intro2
class _StringsWalkthroughIntro2En {
  _StringsWalkthroughIntro2En._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Learn the steps';
  String get body => 'Elevate your everyday meals with professional tips';
}

// Path: recipe.newRecipe
class _StringsRecipeNewRecipeEn {
  _StringsRecipeNewRecipeEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'New Recipe';
  late final _StringsRecipeNewRecipeInputEn input =
      _StringsRecipeNewRecipeInputEn._(_root);
}

// Path: recipe.viewRecipe
class _StringsRecipeViewRecipeEn {
  _StringsRecipeViewRecipeEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Recipe';
  String get edit => 'Edit';
  String get delete => 'Delete';
}

// Path: settings.general
class _StringsSettingsGeneralEn {
  _StringsSettingsGeneralEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get header => 'General';
  late final _StringsSettingsGeneralRowEn row =
      _StringsSettingsGeneralRowEn._(_root);
}

// Path: settings.video
class _StringsSettingsVideoEn {
  _StringsSettingsVideoEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get header => 'Video';
  late final _StringsSettingsVideoRowEn row =
      _StringsSettingsVideoRowEn._(_root);
}

// Path: settings.support
class _StringsSettingsSupportEn {
  _StringsSettingsSupportEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get header => 'Support';
  late final _StringsSettingsSupportRowEn row =
      _StringsSettingsSupportRowEn._(_root);
}

// Path: settings.about
class _StringsSettingsAboutEn {
  _StringsSettingsAboutEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get header => 'About';
  late final _StringsSettingsAboutRowEn row =
      _StringsSettingsAboutRowEn._(_root);
}

// Path: settings.debug
class _StringsSettingsDebugEn {
  _StringsSettingsDebugEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get header => 'Debug';
  late final _StringsSettingsDebugRowEn row =
      _StringsSettingsDebugRowEn._(_root);
}

// Path: recipe.newRecipe.input
class _StringsRecipeNewRecipeInputEn {
  _StringsRecipeNewRecipeInputEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Title';
  String get description => 'Description';
  String get ingredients => 'Ingredients';
  String get ingredients_example => 'e.g. 1 cup of rice';
  String get steps => 'Steps';
  String get steps_example => 'e.g. 1. Cook rice';
  String get add => 'Add';
  String get caution => 'Title and description are required.';
  String get save => 'Save';
}

// Path: settings.general.row
class _StringsSettingsGeneralRowEn {
  _StringsSettingsGeneralRowEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  late final _StringsSettingsGeneralRowThemeEn theme =
      _StringsSettingsGeneralRowThemeEn._(_root);
  late final _StringsSettingsGeneralRowColorEn color =
      _StringsSettingsGeneralRowColorEn._(_root);
  late final _StringsSettingsGeneralRowLanguageEn language =
      _StringsSettingsGeneralRowLanguageEn._(_root);
}

// Path: settings.video.row
class _StringsSettingsVideoRowEn {
  _StringsSettingsVideoRowEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  late final _StringsSettingsVideoRowPlayWithinAppEn playWithinApp =
      _StringsSettingsVideoRowPlayWithinAppEn._(_root);
}

// Path: settings.support.row
class _StringsSettingsSupportRowEn {
  _StringsSettingsSupportRowEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  late final _StringsSettingsSupportRowReviewEn review =
      _StringsSettingsSupportRowReviewEn._(_root);
  late final _StringsSettingsSupportRowShareEn share =
      _StringsSettingsSupportRowShareEn._(_root);
  late final _StringsSettingsSupportRowFeedbackEn feedback =
      _StringsSettingsSupportRowFeedbackEn._(_root);
  late final _StringsSettingsSupportRowContactEn contact =
      _StringsSettingsSupportRowContactEn._(_root);
  late final _StringsSettingsSupportRowHelpEn help =
      _StringsSettingsSupportRowHelpEn._(_root);
}

// Path: settings.about.row
class _StringsSettingsAboutRowEn {
  _StringsSettingsAboutRowEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  late final _StringsSettingsAboutRowTermsEn terms =
      _StringsSettingsAboutRowTermsEn._(_root);
  late final _StringsSettingsAboutRowPrivacyEn privacy =
      _StringsSettingsAboutRowPrivacyEn._(_root);
  late final _StringsSettingsAboutRowVersionEn version =
      _StringsSettingsAboutRowVersionEn._(_root);
  late final _StringsSettingsAboutRowLicenseEn license =
      _StringsSettingsAboutRowLicenseEn._(_root);
}

// Path: settings.debug.row
class _StringsSettingsDebugRowEn {
  _StringsSettingsDebugRowEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  late final _StringsSettingsDebugRowDummyRecipeEn dummyRecipe =
      _StringsSettingsDebugRowDummyRecipeEn._(_root);
  late final _StringsSettingsDebugRowDeleteLocalDataEn deleteLocalData =
      _StringsSettingsDebugRowDeleteLocalDataEn._(_root);
}

// Path: settings.general.row.theme
class _StringsSettingsGeneralRowThemeEn {
  _StringsSettingsGeneralRowThemeEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Theme';
  late final _StringsSettingsGeneralRowThemeThemeEn theme =
      _StringsSettingsGeneralRowThemeThemeEn._(_root);
}

// Path: settings.general.row.color
class _StringsSettingsGeneralRowColorEn {
  _StringsSettingsGeneralRowColorEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Color';
  late final _StringsSettingsGeneralRowColorColorEn color =
      _StringsSettingsGeneralRowColorColorEn._(_root);
}

// Path: settings.general.row.language
class _StringsSettingsGeneralRowLanguageEn {
  _StringsSettingsGeneralRowLanguageEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Language';
  late final _StringsSettingsGeneralRowLanguageLanguageEn language =
      _StringsSettingsGeneralRowLanguageLanguageEn._(_root);
}

// Path: settings.video.row.playWithinApp
class _StringsSettingsVideoRowPlayWithinAppEn {
  _StringsSettingsVideoRowPlayWithinAppEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Play within app';
  String get description => 'This platform does not support play within app';
}

// Path: settings.support.row.review
class _StringsSettingsSupportRowReviewEn {
  _StringsSettingsSupportRowReviewEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Review';
}

// Path: settings.support.row.share
class _StringsSettingsSupportRowShareEn {
  _StringsSettingsSupportRowShareEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Share';
}

// Path: settings.support.row.feedback
class _StringsSettingsSupportRowFeedbackEn {
  _StringsSettingsSupportRowFeedbackEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Feedback';
}

// Path: settings.support.row.contact
class _StringsSettingsSupportRowContactEn {
  _StringsSettingsSupportRowContactEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Contact';
}

// Path: settings.support.row.help
class _StringsSettingsSupportRowHelpEn {
  _StringsSettingsSupportRowHelpEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Help';
}

// Path: settings.about.row.terms
class _StringsSettingsAboutRowTermsEn {
  _StringsSettingsAboutRowTermsEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Terms';
}

// Path: settings.about.row.privacy
class _StringsSettingsAboutRowPrivacyEn {
  _StringsSettingsAboutRowPrivacyEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Privacy';
}

// Path: settings.about.row.version
class _StringsSettingsAboutRowVersionEn {
  _StringsSettingsAboutRowVersionEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Version';
}

// Path: settings.about.row.license
class _StringsSettingsAboutRowLicenseEn {
  _StringsSettingsAboutRowLicenseEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'License';
}

// Path: settings.debug.row.dummyRecipe
class _StringsSettingsDebugRowDummyRecipeEn {
  _StringsSettingsDebugRowDummyRecipeEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Insert Dummy Recipe';
}

// Path: settings.debug.row.deleteLocalData
class _StringsSettingsDebugRowDeleteLocalDataEn {
  _StringsSettingsDebugRowDeleteLocalDataEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Delete Local Data';
}

// Path: settings.general.row.theme.theme
class _StringsSettingsGeneralRowThemeThemeEn {
  _StringsSettingsGeneralRowThemeThemeEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get header => 'Theme';
  List<String> get row => [
        'Automatically',
        'Light',
        'Dark',
      ];
}

// Path: settings.general.row.color.color
class _StringsSettingsGeneralRowColorColorEn {
  _StringsSettingsGeneralRowColorColorEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get header => 'Color';
}

// Path: settings.general.row.language.language
class _StringsSettingsGeneralRowLanguageLanguageEn {
  _StringsSettingsGeneralRowLanguageLanguageEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get header => 'Language';
  List<String> get row => [
        'Automatically',
        'English',
        'Japanese',
      ];
}

// Path: <root>
class _StringsJa implements Translations {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  _StringsJa.build(
      {Map<String, Node>? overrides,
      PluralResolver? cardinalResolver,
      PluralResolver? ordinalResolver})
      : assert(overrides == null,
            'Set "translation_overrides: true" in order to enable this feature.'),
        $meta = TranslationMetadata(
          locale: AppLocale.ja,
          overrides: overrides ?? {},
          cardinalResolver: cardinalResolver,
          ordinalResolver: ordinalResolver,
        ) {
    $meta.setFlatMapFunction(_flatMapFunction);
  }

  /// Metadata for the translations of <ja>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  /// Access flat map
  @override
  dynamic operator [](String key) => $meta.getTranslation(key);

  @override
  late final _StringsJa _root = this; // ignore: unused_field

  // Translations
  @override
  String get appTitle => 'シンプルレシピ検索';
  @override
  late final _StringsTabJa tab = _StringsTabJa._(_root);
  @override
  late final _StringsWalkthroughJa walkthrough = _StringsWalkthroughJa._(_root);
  @override
  late final _StringsRecipeJa recipe = _StringsRecipeJa._(_root);
  @override
  late final _StringsVideoJa video = _StringsVideoJa._(_root);
  @override
  late final _StringsFavoriteJa favorite = _StringsFavoriteJa._(_root);
  @override
  late final _StringsSettingsJa settings = _StringsSettingsJa._(_root);
  @override
  late final _StringsCommonJa common = _StringsCommonJa._(_root);
}

// Path: tab
class _StringsTabJa implements _StringsTabEn {
  _StringsTabJa._(this._root);

  @override
  final _StringsJa _root; // ignore: unused_field

  // Translations
  @override
  String get recipe => 'レシピ';
  @override
  String get video => 'ビデオ';
  @override
  String get favorite => 'お気に入り';
  @override
  String get settings => '設定';
}

// Path: walkthrough
class _StringsWalkthroughJa implements _StringsWalkthroughEn {
  _StringsWalkthroughJa._(this._root);

  @override
  final _StringsJa _root; // ignore: unused_field

  // Translations
  @override
  late final _StringsWalkthroughIntro1Ja intro1 =
      _StringsWalkthroughIntro1Ja._(_root);
  @override
  late final _StringsWalkthroughIntro2Ja intro2 =
      _StringsWalkthroughIntro2Ja._(_root);
  @override
  String get skip => 'スキップ';
  @override
  String get done => '完了';
}

// Path: recipe
class _StringsRecipeJa implements _StringsRecipeEn {
  _StringsRecipeJa._(this._root);

  @override
  final _StringsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'レシピ';
  @override
  String get empty => 'レシピが登録されていません\n新しいレシピを登録しましょう！';
  @override
  String get addRecipe => 'レシピを追加';
  @override
  late final _StringsRecipeNewRecipeJa newRecipe =
      _StringsRecipeNewRecipeJa._(_root);
  @override
  late final _StringsRecipeViewRecipeJa viewRecipe =
      _StringsRecipeViewRecipeJa._(_root);
}

// Path: video
class _StringsVideoJa implements _StringsVideoEn {
  _StringsVideoJa._(this._root);

  @override
  final _StringsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ビデオ';
}

// Path: favorite
class _StringsFavoriteJa implements _StringsFavoriteEn {
  _StringsFavoriteJa._(this._root);

  @override
  final _StringsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'お気に入り';
  @override
  String get empty => '動画をお気に入りに追加しよう！';
}

// Path: settings
class _StringsSettingsJa implements _StringsSettingsEn {
  _StringsSettingsJa._(this._root);

  @override
  final _StringsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => '設定';
  @override
  late final _StringsSettingsGeneralJa general =
      _StringsSettingsGeneralJa._(_root);
  @override
  late final _StringsSettingsVideoJa video = _StringsSettingsVideoJa._(_root);
  @override
  late final _StringsSettingsSupportJa support =
      _StringsSettingsSupportJa._(_root);
  @override
  late final _StringsSettingsAboutJa about = _StringsSettingsAboutJa._(_root);
  @override
  late final _StringsSettingsDebugJa debug = _StringsSettingsDebugJa._(_root);
  @override
  String get selected => '選択中';
}

// Path: common
class _StringsCommonJa implements _StringsCommonEn {
  _StringsCommonJa._(this._root);

  @override
  final _StringsJa _root; // ignore: unused_field

  // Translations
  @override
  String get addFavorite => 'お気に入りに追加しました';
  @override
  String get fetchFailed => 'データを取得できませんでした';
  @override
  String get reload => '再読み込み';
  @override
  String get searchEmpty => '検索結果は0件です';
  @override
  String get more => 'もっと見る';
  @override
  String get searchQuery => '検索ワード（例：から揚げ　ナス）';
  @override
  String get sortByDate => '登録日（新しい順）';
  @override
  String get sortByLikes => '人気順（いいね）';
  @override
  String get sortByViews => '人気順（閲覧数）';
}

// Path: walkthrough.intro1
class _StringsWalkthroughIntro1Ja implements _StringsWalkthroughIntro1En {
  _StringsWalkthroughIntro1Ja._(this._root);

  @override
  final _StringsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => '美味しい毎日を';
  @override
  String get body => 'あなただけのレシピブックを作ろう';
}

// Path: walkthrough.intro2
class _StringsWalkthroughIntro2Ja implements _StringsWalkthroughIntro2En {
  _StringsWalkthroughIntro2Ja._(this._root);

  @override
  final _StringsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => '手順を学ぼう';
  @override
  String get body => 'プロのコツで、いつもの料理をワンランクアップ';
}

// Path: recipe.newRecipe
class _StringsRecipeNewRecipeJa implements _StringsRecipeNewRecipeEn {
  _StringsRecipeNewRecipeJa._(this._root);

  @override
  final _StringsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => '新しいレシピ';
  @override
  late final _StringsRecipeNewRecipeInputJa input =
      _StringsRecipeNewRecipeInputJa._(_root);
}

// Path: recipe.viewRecipe
class _StringsRecipeViewRecipeJa implements _StringsRecipeViewRecipeEn {
  _StringsRecipeViewRecipeJa._(this._root);

  @override
  final _StringsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'レシピ';
  @override
  String get edit => '編集';
  @override
  String get delete => '削除';
}

// Path: settings.general
class _StringsSettingsGeneralJa implements _StringsSettingsGeneralEn {
  _StringsSettingsGeneralJa._(this._root);

  @override
  final _StringsJa _root; // ignore: unused_field

  // Translations
  @override
  String get header => '一般';
  @override
  late final _StringsSettingsGeneralRowJa row =
      _StringsSettingsGeneralRowJa._(_root);
}

// Path: settings.video
class _StringsSettingsVideoJa implements _StringsSettingsVideoEn {
  _StringsSettingsVideoJa._(this._root);

  @override
  final _StringsJa _root; // ignore: unused_field

  // Translations
  @override
  String get header => 'ビデオ';
  @override
  late final _StringsSettingsVideoRowJa row =
      _StringsSettingsVideoRowJa._(_root);
}

// Path: settings.support
class _StringsSettingsSupportJa implements _StringsSettingsSupportEn {
  _StringsSettingsSupportJa._(this._root);

  @override
  final _StringsJa _root; // ignore: unused_field

  // Translations
  @override
  String get header => 'サポート';
  @override
  late final _StringsSettingsSupportRowJa row =
      _StringsSettingsSupportRowJa._(_root);
}

// Path: settings.about
class _StringsSettingsAboutJa implements _StringsSettingsAboutEn {
  _StringsSettingsAboutJa._(this._root);

  @override
  final _StringsJa _root; // ignore: unused_field

  // Translations
  @override
  String get header => 'このアプリについて';
  @override
  late final _StringsSettingsAboutRowJa row =
      _StringsSettingsAboutRowJa._(_root);
}

// Path: settings.debug
class _StringsSettingsDebugJa implements _StringsSettingsDebugEn {
  _StringsSettingsDebugJa._(this._root);

  @override
  final _StringsJa _root; // ignore: unused_field

  // Translations
  @override
  String get header => 'デバッグ';
  @override
  late final _StringsSettingsDebugRowJa row =
      _StringsSettingsDebugRowJa._(_root);
}

// Path: recipe.newRecipe.input
class _StringsRecipeNewRecipeInputJa implements _StringsRecipeNewRecipeInputEn {
  _StringsRecipeNewRecipeInputJa._(this._root);

  @override
  final _StringsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'タイトル';
  @override
  String get description => '概要';
  @override
  String get ingredients => '食材';
  @override
  String get ingredients_example => '例）トマト 2個';
  @override
  String get steps => '手順';
  @override
  String get steps_example => '例）トマトを4等分に切ります...';
  @override
  String get add => '追加';
  @override
  String get caution => 'タイトルと概要は必須です';
  @override
  String get save => '保存';
}

// Path: settings.general.row
class _StringsSettingsGeneralRowJa implements _StringsSettingsGeneralRowEn {
  _StringsSettingsGeneralRowJa._(this._root);

  @override
  final _StringsJa _root; // ignore: unused_field

  // Translations
  @override
  late final _StringsSettingsGeneralRowThemeJa theme =
      _StringsSettingsGeneralRowThemeJa._(_root);
  @override
  late final _StringsSettingsGeneralRowColorJa color =
      _StringsSettingsGeneralRowColorJa._(_root);
  @override
  late final _StringsSettingsGeneralRowLanguageJa language =
      _StringsSettingsGeneralRowLanguageJa._(_root);
}

// Path: settings.video.row
class _StringsSettingsVideoRowJa implements _StringsSettingsVideoRowEn {
  _StringsSettingsVideoRowJa._(this._root);

  @override
  final _StringsJa _root; // ignore: unused_field

  // Translations
  @override
  late final _StringsSettingsVideoRowPlayWithinAppJa playWithinApp =
      _StringsSettingsVideoRowPlayWithinAppJa._(_root);
}

// Path: settings.support.row
class _StringsSettingsSupportRowJa implements _StringsSettingsSupportRowEn {
  _StringsSettingsSupportRowJa._(this._root);

  @override
  final _StringsJa _root; // ignore: unused_field

  // Translations
  @override
  late final _StringsSettingsSupportRowReviewJa review =
      _StringsSettingsSupportRowReviewJa._(_root);
  @override
  late final _StringsSettingsSupportRowShareJa share =
      _StringsSettingsSupportRowShareJa._(_root);
  @override
  late final _StringsSettingsSupportRowFeedbackJa feedback =
      _StringsSettingsSupportRowFeedbackJa._(_root);
  @override
  late final _StringsSettingsSupportRowContactJa contact =
      _StringsSettingsSupportRowContactJa._(_root);
  @override
  late final _StringsSettingsSupportRowHelpJa help =
      _StringsSettingsSupportRowHelpJa._(_root);
}

// Path: settings.about.row
class _StringsSettingsAboutRowJa implements _StringsSettingsAboutRowEn {
  _StringsSettingsAboutRowJa._(this._root);

  @override
  final _StringsJa _root; // ignore: unused_field

  // Translations
  @override
  late final _StringsSettingsAboutRowTermsJa terms =
      _StringsSettingsAboutRowTermsJa._(_root);
  @override
  late final _StringsSettingsAboutRowPrivacyJa privacy =
      _StringsSettingsAboutRowPrivacyJa._(_root);
  @override
  late final _StringsSettingsAboutRowVersionJa version =
      _StringsSettingsAboutRowVersionJa._(_root);
  @override
  late final _StringsSettingsAboutRowLicenseJa license =
      _StringsSettingsAboutRowLicenseJa._(_root);
}

// Path: settings.debug.row
class _StringsSettingsDebugRowJa implements _StringsSettingsDebugRowEn {
  _StringsSettingsDebugRowJa._(this._root);

  @override
  final _StringsJa _root; // ignore: unused_field

  // Translations
  @override
  late final _StringsSettingsDebugRowDummyRecipeJa dummyRecipe =
      _StringsSettingsDebugRowDummyRecipeJa._(_root);
  @override
  late final _StringsSettingsDebugRowDeleteLocalDataJa deleteLocalData =
      _StringsSettingsDebugRowDeleteLocalDataJa._(_root);
}

// Path: settings.general.row.theme
class _StringsSettingsGeneralRowThemeJa
    implements _StringsSettingsGeneralRowThemeEn {
  _StringsSettingsGeneralRowThemeJa._(this._root);

  @override
  final _StringsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'テーマ';
  @override
  late final _StringsSettingsGeneralRowThemeThemeJa theme =
      _StringsSettingsGeneralRowThemeThemeJa._(_root);
}

// Path: settings.general.row.color
class _StringsSettingsGeneralRowColorJa
    implements _StringsSettingsGeneralRowColorEn {
  _StringsSettingsGeneralRowColorJa._(this._root);

  @override
  final _StringsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'カラー';
  @override
  late final _StringsSettingsGeneralRowColorColorJa color =
      _StringsSettingsGeneralRowColorColorJa._(_root);
}

// Path: settings.general.row.language
class _StringsSettingsGeneralRowLanguageJa
    implements _StringsSettingsGeneralRowLanguageEn {
  _StringsSettingsGeneralRowLanguageJa._(this._root);

  @override
  final _StringsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => '言語';
  @override
  late final _StringsSettingsGeneralRowLanguageLanguageJa language =
      _StringsSettingsGeneralRowLanguageLanguageJa._(_root);
}

// Path: settings.video.row.playWithinApp
class _StringsSettingsVideoRowPlayWithinAppJa
    implements _StringsSettingsVideoRowPlayWithinAppEn {
  _StringsSettingsVideoRowPlayWithinAppJa._(this._root);

  @override
  final _StringsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'アプリ内で再生する';
  @override
  String get description => 'このプラットフォームはアプリ内再生をサポートしていません';
}

// Path: settings.support.row.review
class _StringsSettingsSupportRowReviewJa
    implements _StringsSettingsSupportRowReviewEn {
  _StringsSettingsSupportRowReviewJa._(this._root);

  @override
  final _StringsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'レビュー';
}

// Path: settings.support.row.share
class _StringsSettingsSupportRowShareJa
    implements _StringsSettingsSupportRowShareEn {
  _StringsSettingsSupportRowShareJa._(this._root);

  @override
  final _StringsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'シェア';
}

// Path: settings.support.row.feedback
class _StringsSettingsSupportRowFeedbackJa
    implements _StringsSettingsSupportRowFeedbackEn {
  _StringsSettingsSupportRowFeedbackJa._(this._root);

  @override
  final _StringsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'フィードバック';
}

// Path: settings.support.row.contact
class _StringsSettingsSupportRowContactJa
    implements _StringsSettingsSupportRowContactEn {
  _StringsSettingsSupportRowContactJa._(this._root);

  @override
  final _StringsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'お問い合わせ';
}

// Path: settings.support.row.help
class _StringsSettingsSupportRowHelpJa
    implements _StringsSettingsSupportRowHelpEn {
  _StringsSettingsSupportRowHelpJa._(this._root);

  @override
  final _StringsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ヘルプ';
}

// Path: settings.about.row.terms
class _StringsSettingsAboutRowTermsJa
    implements _StringsSettingsAboutRowTermsEn {
  _StringsSettingsAboutRowTermsJa._(this._root);

  @override
  final _StringsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => '利用規約';
}

// Path: settings.about.row.privacy
class _StringsSettingsAboutRowPrivacyJa
    implements _StringsSettingsAboutRowPrivacyEn {
  _StringsSettingsAboutRowPrivacyJa._(this._root);

  @override
  final _StringsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'プライバシーポリシー';
}

// Path: settings.about.row.version
class _StringsSettingsAboutRowVersionJa
    implements _StringsSettingsAboutRowVersionEn {
  _StringsSettingsAboutRowVersionJa._(this._root);

  @override
  final _StringsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'バージョン';
}

// Path: settings.about.row.license
class _StringsSettingsAboutRowLicenseJa
    implements _StringsSettingsAboutRowLicenseEn {
  _StringsSettingsAboutRowLicenseJa._(this._root);

  @override
  final _StringsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ライセンス';
}

// Path: settings.debug.row.dummyRecipe
class _StringsSettingsDebugRowDummyRecipeJa
    implements _StringsSettingsDebugRowDummyRecipeEn {
  _StringsSettingsDebugRowDummyRecipeJa._(this._root);

  @override
  final _StringsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ダミーレシピを登録';
}

// Path: settings.debug.row.deleteLocalData
class _StringsSettingsDebugRowDeleteLocalDataJa
    implements _StringsSettingsDebugRowDeleteLocalDataEn {
  _StringsSettingsDebugRowDeleteLocalDataJa._(this._root);

  @override
  final _StringsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ローカルデータを削除';
}

// Path: settings.general.row.theme.theme
class _StringsSettingsGeneralRowThemeThemeJa
    implements _StringsSettingsGeneralRowThemeThemeEn {
  _StringsSettingsGeneralRowThemeThemeJa._(this._root);

  @override
  final _StringsJa _root; // ignore: unused_field

  // Translations
  @override
  String get header => 'テーマ';
  @override
  List<String> get row => [
        '自動（デバイスの設定に従う）',
        'ライト',
        'ダーク',
      ];
}

// Path: settings.general.row.color.color
class _StringsSettingsGeneralRowColorColorJa
    implements _StringsSettingsGeneralRowColorColorEn {
  _StringsSettingsGeneralRowColorColorJa._(this._root);

  @override
  final _StringsJa _root; // ignore: unused_field

  // Translations
  @override
  String get header => 'カラー';
}

// Path: settings.general.row.language.language
class _StringsSettingsGeneralRowLanguageLanguageJa
    implements _StringsSettingsGeneralRowLanguageLanguageEn {
  _StringsSettingsGeneralRowLanguageLanguageJa._(this._root);

  @override
  final _StringsJa _root; // ignore: unused_field

  // Translations
  @override
  String get header => '言語';
  @override
  List<String> get row => [
        '自動（デバイスの設定に従う）',
        'English',
        '日本語',
      ];
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on Translations {
  dynamic _flatMapFunction(String path) {
    switch (path) {
      case 'appTitle':
        return 'Awesome Japanese Recipe';
      case 'tab.recipe':
        return 'Recipe';
      case 'tab.video':
        return 'Video';
      case 'tab.favorite':
        return 'Favorite';
      case 'tab.settings':
        return 'Settings';
      case 'walkthrough.intro1.title':
        return 'Make every day delicious';
      case 'walkthrough.intro1.body':
        return 'Let\'s create your own recipe book';
      case 'walkthrough.intro2.title':
        return 'Learn the steps';
      case 'walkthrough.intro2.body':
        return 'Elevate your everyday meals with professional tips';
      case 'walkthrough.skip':
        return 'Skip';
      case 'walkthrough.done':
        return 'Done';
      case 'recipe.title':
        return 'Recipe';
      case 'recipe.empty':
        return 'We\'ve got no recipes.\nAdd your best ones!';
      case 'recipe.addRecipe':
        return 'Add Recipe';
      case 'recipe.newRecipe.title':
        return 'New Recipe';
      case 'recipe.newRecipe.input.title':
        return 'Title';
      case 'recipe.newRecipe.input.description':
        return 'Description';
      case 'recipe.newRecipe.input.ingredients':
        return 'Ingredients';
      case 'recipe.newRecipe.input.ingredients_example':
        return 'e.g. 1 cup of rice';
      case 'recipe.newRecipe.input.steps':
        return 'Steps';
      case 'recipe.newRecipe.input.steps_example':
        return 'e.g. 1. Cook rice';
      case 'recipe.newRecipe.input.add':
        return 'Add';
      case 'recipe.newRecipe.input.caution':
        return 'Title and description are required.';
      case 'recipe.newRecipe.input.save':
        return 'Save';
      case 'recipe.viewRecipe.title':
        return 'Recipe';
      case 'recipe.viewRecipe.edit':
        return 'Edit';
      case 'recipe.viewRecipe.delete':
        return 'Delete';
      case 'video.title':
        return 'Video';
      case 'favorite.title':
        return 'Favorite';
      case 'favorite.empty':
        return 'Love a video?\nTap the heart to make it your fave!';
      case 'settings.title':
        return 'Settings';
      case 'settings.general.header':
        return 'General';
      case 'settings.general.row.theme.title':
        return 'Theme';
      case 'settings.general.row.theme.theme.header':
        return 'Theme';
      case 'settings.general.row.theme.theme.row.0':
        return 'Automatically';
      case 'settings.general.row.theme.theme.row.1':
        return 'Light';
      case 'settings.general.row.theme.theme.row.2':
        return 'Dark';
      case 'settings.general.row.color.title':
        return 'Color';
      case 'settings.general.row.color.color.header':
        return 'Color';
      case 'settings.general.row.language.title':
        return 'Language';
      case 'settings.general.row.language.language.header':
        return 'Language';
      case 'settings.general.row.language.language.row.0':
        return 'Automatically';
      case 'settings.general.row.language.language.row.1':
        return 'English';
      case 'settings.general.row.language.language.row.2':
        return 'Japanese';
      case 'settings.video.header':
        return 'Video';
      case 'settings.video.row.playWithinApp.title':
        return 'Play within app';
      case 'settings.video.row.playWithinApp.description':
        return 'This platform does not support play within app';
      case 'settings.support.header':
        return 'Support';
      case 'settings.support.row.review.title':
        return 'Review';
      case 'settings.support.row.share.title':
        return 'Share';
      case 'settings.support.row.feedback.title':
        return 'Feedback';
      case 'settings.support.row.contact.title':
        return 'Contact';
      case 'settings.support.row.help.title':
        return 'Help';
      case 'settings.about.header':
        return 'About';
      case 'settings.about.row.terms.title':
        return 'Terms';
      case 'settings.about.row.privacy.title':
        return 'Privacy';
      case 'settings.about.row.version.title':
        return 'Version';
      case 'settings.about.row.license.title':
        return 'License';
      case 'settings.debug.header':
        return 'Debug';
      case 'settings.debug.row.dummyRecipe.title':
        return 'Insert Dummy Recipe';
      case 'settings.debug.row.deleteLocalData.title':
        return 'Delete Local Data';
      case 'settings.selected':
        return 'Selected';
      case 'common.addFavorite':
        return 'Add Favorite';
      case 'common.fetchFailed':
        return 'Failed to fetch data.';
      case 'common.reload':
        return 'Reload';
      case 'common.searchEmpty':
        return 'The search returned 0 results.';
      case 'common.more':
        return 'More';
      case 'common.searchQuery':
        return 'Search query';
      case 'common.sortByDate':
        return 'Sort by Date (Newest First)';
      case 'common.sortByLikes':
        return 'Popular (Likes)';
      case 'common.sortByViews':
        return 'Popular (Views)';
      default:
        return null;
    }
  }
}

extension on _StringsJa {
  dynamic _flatMapFunction(String path) {
    switch (path) {
      case 'appTitle':
        return 'シンプルレシピ検索';
      case 'tab.recipe':
        return 'レシピ';
      case 'tab.video':
        return 'ビデオ';
      case 'tab.favorite':
        return 'お気に入り';
      case 'tab.settings':
        return '設定';
      case 'walkthrough.intro1.title':
        return '美味しい毎日を';
      case 'walkthrough.intro1.body':
        return 'あなただけのレシピブックを作ろう';
      case 'walkthrough.intro2.title':
        return '手順を学ぼう';
      case 'walkthrough.intro2.body':
        return 'プロのコツで、いつもの料理をワンランクアップ';
      case 'walkthrough.skip':
        return 'スキップ';
      case 'walkthrough.done':
        return '完了';
      case 'recipe.title':
        return 'レシピ';
      case 'recipe.empty':
        return 'レシピが登録されていません\n新しいレシピを登録しましょう！';
      case 'recipe.addRecipe':
        return 'レシピを追加';
      case 'recipe.newRecipe.title':
        return '新しいレシピ';
      case 'recipe.newRecipe.input.title':
        return 'タイトル';
      case 'recipe.newRecipe.input.description':
        return '概要';
      case 'recipe.newRecipe.input.ingredients':
        return '食材';
      case 'recipe.newRecipe.input.ingredients_example':
        return '例）トマト 2個';
      case 'recipe.newRecipe.input.steps':
        return '手順';
      case 'recipe.newRecipe.input.steps_example':
        return '例）トマトを4等分に切ります...';
      case 'recipe.newRecipe.input.add':
        return '追加';
      case 'recipe.newRecipe.input.caution':
        return 'タイトルと概要は必須です';
      case 'recipe.newRecipe.input.save':
        return '保存';
      case 'recipe.viewRecipe.title':
        return 'レシピ';
      case 'recipe.viewRecipe.edit':
        return '編集';
      case 'recipe.viewRecipe.delete':
        return '削除';
      case 'video.title':
        return 'ビデオ';
      case 'favorite.title':
        return 'お気に入り';
      case 'favorite.empty':
        return '動画をお気に入りに追加しよう！';
      case 'settings.title':
        return '設定';
      case 'settings.general.header':
        return '一般';
      case 'settings.general.row.theme.title':
        return 'テーマ';
      case 'settings.general.row.theme.theme.header':
        return 'テーマ';
      case 'settings.general.row.theme.theme.row.0':
        return '自動（デバイスの設定に従う）';
      case 'settings.general.row.theme.theme.row.1':
        return 'ライト';
      case 'settings.general.row.theme.theme.row.2':
        return 'ダーク';
      case 'settings.general.row.color.title':
        return 'カラー';
      case 'settings.general.row.color.color.header':
        return 'カラー';
      case 'settings.general.row.language.title':
        return '言語';
      case 'settings.general.row.language.language.header':
        return '言語';
      case 'settings.general.row.language.language.row.0':
        return '自動（デバイスの設定に従う）';
      case 'settings.general.row.language.language.row.1':
        return 'English';
      case 'settings.general.row.language.language.row.2':
        return '日本語';
      case 'settings.video.header':
        return 'ビデオ';
      case 'settings.video.row.playWithinApp.title':
        return 'アプリ内で再生する';
      case 'settings.video.row.playWithinApp.description':
        return 'このプラットフォームはアプリ内再生をサポートしていません';
      case 'settings.support.header':
        return 'サポート';
      case 'settings.support.row.review.title':
        return 'レビュー';
      case 'settings.support.row.share.title':
        return 'シェア';
      case 'settings.support.row.feedback.title':
        return 'フィードバック';
      case 'settings.support.row.contact.title':
        return 'お問い合わせ';
      case 'settings.support.row.help.title':
        return 'ヘルプ';
      case 'settings.about.header':
        return 'このアプリについて';
      case 'settings.about.row.terms.title':
        return '利用規約';
      case 'settings.about.row.privacy.title':
        return 'プライバシーポリシー';
      case 'settings.about.row.version.title':
        return 'バージョン';
      case 'settings.about.row.license.title':
        return 'ライセンス';
      case 'settings.debug.header':
        return 'デバッグ';
      case 'settings.debug.row.dummyRecipe.title':
        return 'ダミーレシピを登録';
      case 'settings.debug.row.deleteLocalData.title':
        return 'ローカルデータを削除';
      case 'settings.selected':
        return '選択中';
      case 'common.addFavorite':
        return 'お気に入りに追加しました';
      case 'common.fetchFailed':
        return 'データを取得できませんでした';
      case 'common.reload':
        return '再読み込み';
      case 'common.searchEmpty':
        return '検索結果は0件です';
      case 'common.more':
        return 'もっと見る';
      case 'common.searchQuery':
        return '検索ワード（例：から揚げ　ナス）';
      case 'common.sortByDate':
        return '登録日（新しい順）';
      case 'common.sortByLikes':
        return '人気順（いいね）';
      case 'common.sortByViews':
        return '人気順（閲覧数）';
      default:
        return null;
    }
  }
}
