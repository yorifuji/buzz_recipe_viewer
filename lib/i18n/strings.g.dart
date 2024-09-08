/// Generated file. Do not edit.
///
/// Original: lib/i18n
/// To regenerate, run: `dart run slang`
///
/// Locales: 2
/// Strings: 213 (106 per locale)
///
/// Built on 2024-09-07 at 15:42 UTC

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
  late final _StringsAppEn app = _StringsAppEn._(_root);
  late final _StringsTabEn tab = _StringsTabEn._(_root);
  late final _StringsWalkthroughEn walkthrough = _StringsWalkthroughEn._(_root);
  late final _StringsProvisioningEn provisioning =
      _StringsProvisioningEn._(_root);
  late final _StringsRecipeEn recipe = _StringsRecipeEn._(_root);
  late final _StringsVideoEn video = _StringsVideoEn._(_root);
  late final _StringsFavoriteEn favorite = _StringsFavoriteEn._(_root);
  late final _StringsSettingsEn settings = _StringsSettingsEn._(_root);
  late final _StringsCommonEn common = _StringsCommonEn._(_root);
  late final _StringsErrorEn error = _StringsErrorEn._(_root);
}

// Path: app
class _StringsAppEn {
  _StringsAppEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Awesome Japanese Recipe';
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
  late final _StringsWalkthroughIntro3En intro3 =
      _StringsWalkthroughIntro3En._(_root);
  String get skip => 'Skip';
  String get done => 'Done';
}

// Path: provisioning
class _StringsProvisioningEn {
  _StringsProvisioningEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get provisioning => 'Provisioning Your Account...';
  String get retry => 'Retry';
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
  late final _StringsSettingsCommonEn common =
      _StringsSettingsCommonEn._(_root);
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

// Path: error
class _StringsErrorEn {
  _StringsErrorEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  late final _StringsErrorAuthEn auth = _StringsErrorAuthEn._(_root);
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

// Path: walkthrough.intro3
class _StringsWalkthroughIntro3En {
  _StringsWalkthroughIntro3En._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Get the latest info';
  String get body => 'We\'ll send you new recipes with push notifications';
  String get requestPermission => 'Allow Notifications';
  String get openNotificationSettings => 'Open Notification Settings';
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
  late final _StringsSettingsGeneralNotificationsEn notifications =
      _StringsSettingsGeneralNotificationsEn._(_root);
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
  late final _StringsSettingsDebugSectionsEn sections =
      _StringsSettingsDebugSectionsEn._(_root);
}

// Path: settings.common
class _StringsSettingsCommonEn {
  _StringsSettingsCommonEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get selected => 'Selected';
}

// Path: error.auth
class _StringsErrorAuthEn {
  _StringsErrorAuthEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get emailAlreadyInUse => 'Email already in use.';
  String get invalidEmail => 'Invalid email address.';
  String get operationNotAllowed => 'Operation not allowed.';
  String get weakPassword => 'Weak password.';
  String get userDisabled => 'User disabled.';
  String get userNotFound => 'User not found.';
  String get wrongPassword => 'Wrong password.';
  String get providerAlreadyLinked => 'Provider already linked.';
  String get invalidCredential => 'Invalid credential.';
  String get credentialAlreadyInUse => 'Credential already in use.';
  String get invalidVerificationCode => 'Invalid verification code.';
  String get invalidVerificationId => 'Invalid verification ID.';
  String get adminRestrictedOperation => 'Admin restricted operation.';
  String get internalError => 'Internal error.';
  String get networkRequestFailed => 'Network request failed.';
  String get unknown => 'Unknown error.';
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

// Path: settings.general.notifications
class _StringsSettingsGeneralNotificationsEn {
  _StringsSettingsGeneralNotificationsEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Notifications';
  late final _StringsSettingsGeneralNotificationsPageEn page =
      _StringsSettingsGeneralNotificationsPageEn._(_root);
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

// Path: settings.debug.sections
class _StringsSettingsDebugSectionsEn {
  _StringsSettingsDebugSectionsEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  late final _StringsSettingsDebugSectionsGeneralEn general =
      _StringsSettingsDebugSectionsGeneralEn._(_root);
  late final _StringsSettingsDebugSectionsFirebaseEn firebase =
      _StringsSettingsDebugSectionsFirebaseEn._(_root);
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

// Path: settings.general.notifications.page
class _StringsSettingsGeneralNotificationsPageEn {
  _StringsSettingsGeneralNotificationsPageEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Notifications';
  late final _StringsSettingsGeneralNotificationsPageSettingsEn settings =
      _StringsSettingsGeneralNotificationsPageSettingsEn._(_root);
  late final _StringsSettingsGeneralNotificationsPageTopicEn topic =
      _StringsSettingsGeneralNotificationsPageTopicEn._(_root);
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

// Path: settings.debug.sections.general
class _StringsSettingsDebugSectionsGeneralEn {
  _StringsSettingsDebugSectionsGeneralEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'General';
  late final _StringsSettingsDebugSectionsGeneralDeleteLocalDataEn
      deleteLocalData =
      _StringsSettingsDebugSectionsGeneralDeleteLocalDataEn._(_root);
}

// Path: settings.debug.sections.firebase
class _StringsSettingsDebugSectionsFirebaseEn {
  _StringsSettingsDebugSectionsFirebaseEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'General';
  late final _StringsSettingsDebugSectionsFirebaseAddSampleRecipeEn
      addSampleRecipe =
      _StringsSettingsDebugSectionsFirebaseAddSampleRecipeEn._(_root);
  late final _StringsSettingsDebugSectionsFirebaseFirestoreCreateDataEn
      firestoreCreateData =
      _StringsSettingsDebugSectionsFirebaseFirestoreCreateDataEn._(_root);
  late final _StringsSettingsDebugSectionsFirebaseFirestoreDeleteDataEn
      firestoreDeleteData =
      _StringsSettingsDebugSectionsFirebaseFirestoreDeleteDataEn._(_root);
  late final _StringsSettingsDebugSectionsFirebaseAuthUidEn authUid =
      _StringsSettingsDebugSectionsFirebaseAuthUidEn._(_root);
  late final _StringsSettingsDebugSectionsFirebaseFcmTokenEn fcmToken =
      _StringsSettingsDebugSectionsFirebaseFcmTokenEn._(_root);
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

// Path: settings.general.notifications.page.settings
class _StringsSettingsGeneralNotificationsPageSettingsEn {
  _StringsSettingsGeneralNotificationsPageSettingsEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Notifications';
  List<String> get items => [
        'Allow Notifications',
      ];
}

// Path: settings.general.notifications.page.topic
class _StringsSettingsGeneralNotificationsPageTopicEn {
  _StringsSettingsGeneralNotificationsPageTopicEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Topic';
  List<String> get items => [
        'General',
        'Video',
      ];
}

// Path: settings.debug.sections.general.deleteLocalData
class _StringsSettingsDebugSectionsGeneralDeleteLocalDataEn {
  _StringsSettingsDebugSectionsGeneralDeleteLocalDataEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Delete Local Data';
}

// Path: settings.debug.sections.firebase.addSampleRecipe
class _StringsSettingsDebugSectionsFirebaseAddSampleRecipeEn {
  _StringsSettingsDebugSectionsFirebaseAddSampleRecipeEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Add Sample Recipe';
}

// Path: settings.debug.sections.firebase.firestoreCreateData
class _StringsSettingsDebugSectionsFirebaseFirestoreCreateDataEn {
  _StringsSettingsDebugSectionsFirebaseFirestoreCreateDataEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Create Data in Firestore';
}

// Path: settings.debug.sections.firebase.firestoreDeleteData
class _StringsSettingsDebugSectionsFirebaseFirestoreDeleteDataEn {
  _StringsSettingsDebugSectionsFirebaseFirestoreDeleteDataEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Delete Data in Firestore';
}

// Path: settings.debug.sections.firebase.authUid
class _StringsSettingsDebugSectionsFirebaseAuthUidEn {
  _StringsSettingsDebugSectionsFirebaseAuthUidEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Copy Firebase Auth UID';
}

// Path: settings.debug.sections.firebase.fcmToken
class _StringsSettingsDebugSectionsFirebaseFcmTokenEn {
  _StringsSettingsDebugSectionsFirebaseFcmTokenEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Copy FCM Token';
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
  late final _StringsAppJa app = _StringsAppJa._(_root);
  @override
  late final _StringsTabJa tab = _StringsTabJa._(_root);
  @override
  late final _StringsWalkthroughJa walkthrough = _StringsWalkthroughJa._(_root);
  @override
  late final _StringsProvisioningJa provisioning =
      _StringsProvisioningJa._(_root);
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
  @override
  late final _StringsErrorJa error = _StringsErrorJa._(_root);
}

// Path: app
class _StringsAppJa implements _StringsAppEn {
  _StringsAppJa._(this._root);

  @override
  final _StringsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'シンプルレシピ検索';
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
  String get video => '動画';
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
  late final _StringsWalkthroughIntro3Ja intro3 =
      _StringsWalkthroughIntro3Ja._(_root);
  @override
  String get skip => 'スキップ';
  @override
  String get done => '完了';
}

// Path: provisioning
class _StringsProvisioningJa implements _StringsProvisioningEn {
  _StringsProvisioningJa._(this._root);

  @override
  final _StringsJa _root; // ignore: unused_field

  // Translations
  @override
  String get provisioning => 'アカウントを準備しています...';
  @override
  String get retry => '再試行';
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
  String get title => '動画';
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
  late final _StringsSettingsCommonJa common =
      _StringsSettingsCommonJa._(_root);
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
  @override
  String get selected => '選択中';
}

// Path: error
class _StringsErrorJa implements _StringsErrorEn {
  _StringsErrorJa._(this._root);

  @override
  final _StringsJa _root; // ignore: unused_field

  // Translations
  @override
  late final _StringsErrorAuthJa auth = _StringsErrorAuthJa._(_root);
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

// Path: walkthrough.intro3
class _StringsWalkthroughIntro3Ja implements _StringsWalkthroughIntro3En {
  _StringsWalkthroughIntro3Ja._(this._root);

  @override
  final _StringsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => '最新情報を受け取ろう';
  @override
  String get body => 'プッシュ通知で新着レシピをお届けします';
  @override
  String get requestPermission => '通知を許可';
  @override
  String get openNotificationSettings => '通知設定を開く';
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
  @override
  late final _StringsSettingsGeneralNotificationsJa notifications =
      _StringsSettingsGeneralNotificationsJa._(_root);
}

// Path: settings.video
class _StringsSettingsVideoJa implements _StringsSettingsVideoEn {
  _StringsSettingsVideoJa._(this._root);

  @override
  final _StringsJa _root; // ignore: unused_field

  // Translations
  @override
  String get header => '動画';
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
  late final _StringsSettingsDebugSectionsJa sections =
      _StringsSettingsDebugSectionsJa._(_root);
}

// Path: settings.common
class _StringsSettingsCommonJa implements _StringsSettingsCommonEn {
  _StringsSettingsCommonJa._(this._root);

  @override
  final _StringsJa _root; // ignore: unused_field

  // Translations
  @override
  String get selected => '選択中';
}

// Path: error.auth
class _StringsErrorAuthJa implements _StringsErrorAuthEn {
  _StringsErrorAuthJa._(this._root);

  @override
  final _StringsJa _root; // ignore: unused_field

  // Translations
  @override
  String get emailAlreadyInUse => 'このメールアドレスは既に使用されています';
  @override
  String get invalidEmail => 'メールアドレスが無効です';
  @override
  String get operationNotAllowed => 'メール/パスワード認証が無効です';
  @override
  String get weakPassword => 'パスワードが弱すぎます';
  @override
  String get userDisabled => 'このユーザーは無効です';
  @override
  String get userNotFound => 'ユーザーが見つかりませんでした';
  @override
  String get wrongPassword => 'パスワードが間違っています';
  @override
  String get providerAlreadyLinked => 'このアカウントは既にリンクされています';
  @override
  String get invalidCredential => '認証情報が無効です';
  @override
  String get credentialAlreadyInUse => 'この認証情報は既に使用されています';
  @override
  String get invalidVerificationCode => '認証コードが無効です';
  @override
  String get invalidVerificationId => '認証IDが無効です';
  @override
  String get adminRestrictedOperation => '管理者によって制限された操作です';
  @override
  String get internalError => '内部エラーが発生しました';
  @override
  String get networkRequestFailed => 'ネットワークエラーが発生しました';
  @override
  String get unknown => '不明なエラーが発生しました';
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

// Path: settings.general.notifications
class _StringsSettingsGeneralNotificationsJa
    implements _StringsSettingsGeneralNotificationsEn {
  _StringsSettingsGeneralNotificationsJa._(this._root);

  @override
  final _StringsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => '通知設定';
  @override
  late final _StringsSettingsGeneralNotificationsPageJa page =
      _StringsSettingsGeneralNotificationsPageJa._(_root);
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

// Path: settings.debug.sections
class _StringsSettingsDebugSectionsJa
    implements _StringsSettingsDebugSectionsEn {
  _StringsSettingsDebugSectionsJa._(this._root);

  @override
  final _StringsJa _root; // ignore: unused_field

  // Translations
  @override
  late final _StringsSettingsDebugSectionsGeneralJa general =
      _StringsSettingsDebugSectionsGeneralJa._(_root);
  @override
  late final _StringsSettingsDebugSectionsFirebaseJa firebase =
      _StringsSettingsDebugSectionsFirebaseJa._(_root);
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

// Path: settings.general.notifications.page
class _StringsSettingsGeneralNotificationsPageJa
    implements _StringsSettingsGeneralNotificationsPageEn {
  _StringsSettingsGeneralNotificationsPageJa._(this._root);

  @override
  final _StringsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => '通知設定';
  @override
  late final _StringsSettingsGeneralNotificationsPageSettingsJa settings =
      _StringsSettingsGeneralNotificationsPageSettingsJa._(_root);
  @override
  late final _StringsSettingsGeneralNotificationsPageTopicJa topic =
      _StringsSettingsGeneralNotificationsPageTopicJa._(_root);
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

// Path: settings.debug.sections.general
class _StringsSettingsDebugSectionsGeneralJa
    implements _StringsSettingsDebugSectionsGeneralEn {
  _StringsSettingsDebugSectionsGeneralJa._(this._root);

  @override
  final _StringsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => '一般';
  @override
  late final _StringsSettingsDebugSectionsGeneralDeleteLocalDataJa
      deleteLocalData =
      _StringsSettingsDebugSectionsGeneralDeleteLocalDataJa._(_root);
}

// Path: settings.debug.sections.firebase
class _StringsSettingsDebugSectionsFirebaseJa
    implements _StringsSettingsDebugSectionsFirebaseEn {
  _StringsSettingsDebugSectionsFirebaseJa._(this._root);

  @override
  final _StringsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Firebase';
  @override
  late final _StringsSettingsDebugSectionsFirebaseAddSampleRecipeJa
      addSampleRecipe =
      _StringsSettingsDebugSectionsFirebaseAddSampleRecipeJa._(_root);
  @override
  late final _StringsSettingsDebugSectionsFirebaseFirestoreCreateDataJa
      firestoreCreateData =
      _StringsSettingsDebugSectionsFirebaseFirestoreCreateDataJa._(_root);
  @override
  late final _StringsSettingsDebugSectionsFirebaseFirestoreDeleteDataJa
      firestoreDeleteData =
      _StringsSettingsDebugSectionsFirebaseFirestoreDeleteDataJa._(_root);
  @override
  late final _StringsSettingsDebugSectionsFirebaseAuthUidJa authUid =
      _StringsSettingsDebugSectionsFirebaseAuthUidJa._(_root);
  @override
  late final _StringsSettingsDebugSectionsFirebaseFcmTokenJa fcmToken =
      _StringsSettingsDebugSectionsFirebaseFcmTokenJa._(_root);
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

// Path: settings.general.notifications.page.settings
class _StringsSettingsGeneralNotificationsPageSettingsJa
    implements _StringsSettingsGeneralNotificationsPageSettingsEn {
  _StringsSettingsGeneralNotificationsPageSettingsJa._(this._root);

  @override
  final _StringsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => '通知';
  @override
  List<String> get items => [
        '通知を許可',
      ];
}

// Path: settings.general.notifications.page.topic
class _StringsSettingsGeneralNotificationsPageTopicJa
    implements _StringsSettingsGeneralNotificationsPageTopicEn {
  _StringsSettingsGeneralNotificationsPageTopicJa._(this._root);

  @override
  final _StringsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'トピック';
  @override
  List<String> get items => [
        '一般',
        '新しいビデオの追加',
      ];
}

// Path: settings.debug.sections.general.deleteLocalData
class _StringsSettingsDebugSectionsGeneralDeleteLocalDataJa
    implements _StringsSettingsDebugSectionsGeneralDeleteLocalDataEn {
  _StringsSettingsDebugSectionsGeneralDeleteLocalDataJa._(this._root);

  @override
  final _StringsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ローカルデータを削除';
}

// Path: settings.debug.sections.firebase.addSampleRecipe
class _StringsSettingsDebugSectionsFirebaseAddSampleRecipeJa
    implements _StringsSettingsDebugSectionsFirebaseAddSampleRecipeEn {
  _StringsSettingsDebugSectionsFirebaseAddSampleRecipeJa._(this._root);

  @override
  final _StringsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'サンプルレシピを追加';
}

// Path: settings.debug.sections.firebase.firestoreCreateData
class _StringsSettingsDebugSectionsFirebaseFirestoreCreateDataJa
    implements _StringsSettingsDebugSectionsFirebaseFirestoreCreateDataEn {
  _StringsSettingsDebugSectionsFirebaseFirestoreCreateDataJa._(this._root);

  @override
  final _StringsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Firestoreにテストデータを追加';
}

// Path: settings.debug.sections.firebase.firestoreDeleteData
class _StringsSettingsDebugSectionsFirebaseFirestoreDeleteDataJa
    implements _StringsSettingsDebugSectionsFirebaseFirestoreDeleteDataEn {
  _StringsSettingsDebugSectionsFirebaseFirestoreDeleteDataJa._(this._root);

  @override
  final _StringsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Firestoreのデータを削除';
}

// Path: settings.debug.sections.firebase.authUid
class _StringsSettingsDebugSectionsFirebaseAuthUidJa
    implements _StringsSettingsDebugSectionsFirebaseAuthUidEn {
  _StringsSettingsDebugSectionsFirebaseAuthUidJa._(this._root);

  @override
  final _StringsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Firebase Auth UIDをコピー';
}

// Path: settings.debug.sections.firebase.fcmToken
class _StringsSettingsDebugSectionsFirebaseFcmTokenJa
    implements _StringsSettingsDebugSectionsFirebaseFcmTokenEn {
  _StringsSettingsDebugSectionsFirebaseFcmTokenJa._(this._root);

  @override
  final _StringsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'FCMトークンをコピー';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on Translations {
  dynamic _flatMapFunction(String path) {
    switch (path) {
      case 'app.title':
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
      case 'walkthrough.intro3.title':
        return 'Get the latest info';
      case 'walkthrough.intro3.body':
        return 'We\'ll send you new recipes with push notifications';
      case 'walkthrough.intro3.requestPermission':
        return 'Allow Notifications';
      case 'walkthrough.intro3.openNotificationSettings':
        return 'Open Notification Settings';
      case 'walkthrough.skip':
        return 'Skip';
      case 'walkthrough.done':
        return 'Done';
      case 'provisioning.provisioning':
        return 'Provisioning Your Account...';
      case 'provisioning.retry':
        return 'Retry';
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
      case 'settings.general.notifications.title':
        return 'Notifications';
      case 'settings.general.notifications.page.title':
        return 'Notifications';
      case 'settings.general.notifications.page.settings.title':
        return 'Notifications';
      case 'settings.general.notifications.page.settings.items.0':
        return 'Allow Notifications';
      case 'settings.general.notifications.page.topic.title':
        return 'Topic';
      case 'settings.general.notifications.page.topic.items.0':
        return 'General';
      case 'settings.general.notifications.page.topic.items.1':
        return 'Video';
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
      case 'settings.debug.sections.general.title':
        return 'General';
      case 'settings.debug.sections.general.deleteLocalData.title':
        return 'Delete Local Data';
      case 'settings.debug.sections.firebase.title':
        return 'General';
      case 'settings.debug.sections.firebase.addSampleRecipe.title':
        return 'Add Sample Recipe';
      case 'settings.debug.sections.firebase.firestoreCreateData.title':
        return 'Create Data in Firestore';
      case 'settings.debug.sections.firebase.firestoreDeleteData.title':
        return 'Delete Data in Firestore';
      case 'settings.debug.sections.firebase.authUid.title':
        return 'Copy Firebase Auth UID';
      case 'settings.debug.sections.firebase.fcmToken.title':
        return 'Copy FCM Token';
      case 'settings.common.selected':
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
      case 'error.auth.emailAlreadyInUse':
        return 'Email already in use.';
      case 'error.auth.invalidEmail':
        return 'Invalid email address.';
      case 'error.auth.operationNotAllowed':
        return 'Operation not allowed.';
      case 'error.auth.weakPassword':
        return 'Weak password.';
      case 'error.auth.userDisabled':
        return 'User disabled.';
      case 'error.auth.userNotFound':
        return 'User not found.';
      case 'error.auth.wrongPassword':
        return 'Wrong password.';
      case 'error.auth.providerAlreadyLinked':
        return 'Provider already linked.';
      case 'error.auth.invalidCredential':
        return 'Invalid credential.';
      case 'error.auth.credentialAlreadyInUse':
        return 'Credential already in use.';
      case 'error.auth.invalidVerificationCode':
        return 'Invalid verification code.';
      case 'error.auth.invalidVerificationId':
        return 'Invalid verification ID.';
      case 'error.auth.adminRestrictedOperation':
        return 'Admin restricted operation.';
      case 'error.auth.internalError':
        return 'Internal error.';
      case 'error.auth.networkRequestFailed':
        return 'Network request failed.';
      case 'error.auth.unknown':
        return 'Unknown error.';
      default:
        return null;
    }
  }
}

extension on _StringsJa {
  dynamic _flatMapFunction(String path) {
    switch (path) {
      case 'app.title':
        return 'シンプルレシピ検索';
      case 'tab.recipe':
        return 'レシピ';
      case 'tab.video':
        return '動画';
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
      case 'walkthrough.intro3.title':
        return '最新情報を受け取ろう';
      case 'walkthrough.intro3.body':
        return 'プッシュ通知で新着レシピをお届けします';
      case 'walkthrough.intro3.requestPermission':
        return '通知を許可';
      case 'walkthrough.intro3.openNotificationSettings':
        return '通知設定を開く';
      case 'walkthrough.skip':
        return 'スキップ';
      case 'walkthrough.done':
        return '完了';
      case 'provisioning.provisioning':
        return 'アカウントを準備しています...';
      case 'provisioning.retry':
        return '再試行';
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
        return '動画';
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
      case 'settings.general.notifications.title':
        return '通知設定';
      case 'settings.general.notifications.page.title':
        return '通知設定';
      case 'settings.general.notifications.page.settings.title':
        return '通知';
      case 'settings.general.notifications.page.settings.items.0':
        return '通知を許可';
      case 'settings.general.notifications.page.topic.title':
        return 'トピック';
      case 'settings.general.notifications.page.topic.items.0':
        return '一般';
      case 'settings.general.notifications.page.topic.items.1':
        return '新しいビデオの追加';
      case 'settings.video.header':
        return '動画';
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
      case 'settings.debug.sections.general.title':
        return '一般';
      case 'settings.debug.sections.general.deleteLocalData.title':
        return 'ローカルデータを削除';
      case 'settings.debug.sections.firebase.title':
        return 'Firebase';
      case 'settings.debug.sections.firebase.addSampleRecipe.title':
        return 'サンプルレシピを追加';
      case 'settings.debug.sections.firebase.firestoreCreateData.title':
        return 'Firestoreにテストデータを追加';
      case 'settings.debug.sections.firebase.firestoreDeleteData.title':
        return 'Firestoreのデータを削除';
      case 'settings.debug.sections.firebase.authUid.title':
        return 'Firebase Auth UIDをコピー';
      case 'settings.debug.sections.firebase.fcmToken.title':
        return 'FCMトークンをコピー';
      case 'settings.common.selected':
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
      case 'common.selected':
        return '選択中';
      case 'error.auth.emailAlreadyInUse':
        return 'このメールアドレスは既に使用されています';
      case 'error.auth.invalidEmail':
        return 'メールアドレスが無効です';
      case 'error.auth.operationNotAllowed':
        return 'メール/パスワード認証が無効です';
      case 'error.auth.weakPassword':
        return 'パスワードが弱すぎます';
      case 'error.auth.userDisabled':
        return 'このユーザーは無効です';
      case 'error.auth.userNotFound':
        return 'ユーザーが見つかりませんでした';
      case 'error.auth.wrongPassword':
        return 'パスワードが間違っています';
      case 'error.auth.providerAlreadyLinked':
        return 'このアカウントは既にリンクされています';
      case 'error.auth.invalidCredential':
        return '認証情報が無効です';
      case 'error.auth.credentialAlreadyInUse':
        return 'この認証情報は既に使用されています';
      case 'error.auth.invalidVerificationCode':
        return '認証コードが無効です';
      case 'error.auth.invalidVerificationId':
        return '認証IDが無効です';
      case 'error.auth.adminRestrictedOperation':
        return '管理者によって制限された操作です';
      case 'error.auth.internalError':
        return '内部エラーが発生しました';
      case 'error.auth.networkRequestFailed':
        return 'ネットワークエラーが発生しました';
      case 'error.auth.unknown':
        return '不明なエラーが発生しました';
      default:
        return null;
    }
  }
}
