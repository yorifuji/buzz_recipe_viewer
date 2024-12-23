///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

part of 'strings.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element

class Translations implements BaseTranslations<AppLocale, Translations> {
  /// Returns the current translations of the given [context].
  ///
  /// Usage:
  /// final t = Translations.of(context);
  static Translations of(BuildContext context) =>
      InheritedLocaleData.of<AppLocale, Translations>(context).translations;

  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  Translations(
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
  late final TranslationsAppEn app = TranslationsAppEn._(_root);
  late final TranslationsTabEn tab = TranslationsTabEn._(_root);
  late final TranslationsMaintenanceEn maintenance =
      TranslationsMaintenanceEn._(_root);
  late final TranslationsWalkthroughEn walkthrough =
      TranslationsWalkthroughEn._(_root);
  late final TranslationsProvisioningEn provisioning =
      TranslationsProvisioningEn._(_root);
  late final TranslationsRecipeEn recipe = TranslationsRecipeEn._(_root);
  late final TranslationsVideoEn video = TranslationsVideoEn._(_root);
  late final TranslationsFavoriteEn favorite = TranslationsFavoriteEn._(_root);
  late final TranslationsSettingsEn settings = TranslationsSettingsEn._(_root);
  late final TranslationsImagePickerEn imagePicker =
      TranslationsImagePickerEn._(_root);
  late final TranslationsCommonEn common = TranslationsCommonEn._(_root);
  late final TranslationsErrorEn error = TranslationsErrorEn._(_root);
}

// Path: app
class TranslationsAppEn {
  TranslationsAppEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Awesome Japanese Recipe';
}

// Path: tab
class TranslationsTabEn {
  TranslationsTabEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get recipe => 'Recipe';
  String get video => 'Video';
  String get favorite => 'Favorite';
  String get settings => 'Settings';
}

// Path: maintenance
class TranslationsMaintenanceEn {
  TranslationsMaintenanceEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Maintenance';
  String get body => 'We\'re currently performing\nmaintenance.';
}

// Path: walkthrough
class TranslationsWalkthroughEn {
  TranslationsWalkthroughEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  late final TranslationsWalkthroughIntro1En intro1 =
      TranslationsWalkthroughIntro1En._(_root);
  late final TranslationsWalkthroughIntro2En intro2 =
      TranslationsWalkthroughIntro2En._(_root);
  late final TranslationsWalkthroughIntro3En intro3 =
      TranslationsWalkthroughIntro3En._(_root);
  String get skip => 'Skip';
  String get done => 'Done';
}

// Path: provisioning
class TranslationsProvisioningEn {
  TranslationsProvisioningEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get provisioning => 'Provisioning Your Account...';
  String get retry => 'Retry';
}

// Path: recipe
class TranslationsRecipeEn {
  TranslationsRecipeEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Recipe';
  String get empty => 'We\'ve got no recipes.\nAdd your best ones!';
  String get addRecipe => 'Add Recipe';
  late final TranslationsRecipeNewRecipeEn newRecipe =
      TranslationsRecipeNewRecipeEn._(_root);
  late final TranslationsRecipeViewRecipeEn viewRecipe =
      TranslationsRecipeViewRecipeEn._(_root);
  late final TranslationsRecipeCommonEn common =
      TranslationsRecipeCommonEn._(_root);
}

// Path: video
class TranslationsVideoEn {
  TranslationsVideoEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Video';
  String get refresh => 'refresh';
}

// Path: favorite
class TranslationsFavoriteEn {
  TranslationsFavoriteEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Favorite';
  String get empty => 'Love a video?\nTap the heart to make it your fave!';
}

// Path: settings
class TranslationsSettingsEn {
  TranslationsSettingsEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Settings';
  late final TranslationsSettingsGeneralEn general =
      TranslationsSettingsGeneralEn._(_root);
  late final TranslationsSettingsVideoEn video =
      TranslationsSettingsVideoEn._(_root);
  late final TranslationsSettingsSupportEn support =
      TranslationsSettingsSupportEn._(_root);
  late final TranslationsSettingsAboutEn about =
      TranslationsSettingsAboutEn._(_root);
  late final TranslationsSettingsAccountEn account =
      TranslationsSettingsAccountEn._(_root);
  late final TranslationsSettingsDebugEn debug =
      TranslationsSettingsDebugEn._(_root);
  late final TranslationsSettingsCommonEn common =
      TranslationsSettingsCommonEn._(_root);
}

// Path: imagePicker
class TranslationsImagePickerEn {
  TranslationsImagePickerEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Image Picker';
  String get takePhoto => 'Take Photo';
  String get chooseFromLibrary => 'Choose from Library';
  String get noImageSelected => 'No image selected';
}

// Path: common
class TranslationsCommonEn {
  TranslationsCommonEn._(this._root);

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
  String get cancel => 'Cancel';
  String get ok => 'OK';
}

// Path: error
class TranslationsErrorEn {
  TranslationsErrorEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  late final TranslationsErrorAuthEn auth = TranslationsErrorAuthEn._(_root);
  late final TranslationsErrorStorageEn storage =
      TranslationsErrorStorageEn._(_root);
}

// Path: walkthrough.intro1
class TranslationsWalkthroughIntro1En {
  TranslationsWalkthroughIntro1En._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Make every day delicious';
  String get body => 'Let\'s create your own recipe book';
}

// Path: walkthrough.intro2
class TranslationsWalkthroughIntro2En {
  TranslationsWalkthroughIntro2En._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Learn the steps';
  String get body => 'Elevate your everyday meals with professional tips';
}

// Path: walkthrough.intro3
class TranslationsWalkthroughIntro3En {
  TranslationsWalkthroughIntro3En._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Get the latest info';
  String get body => 'We\'ll send you new recipes with push notifications';
  String get requestPermission => 'Allow Notifications';
  String get openNotificationSettings => 'Open Notification Settings';
}

// Path: recipe.newRecipe
class TranslationsRecipeNewRecipeEn {
  TranslationsRecipeNewRecipeEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'New Recipe';
  late final TranslationsRecipeNewRecipeInputEn input =
      TranslationsRecipeNewRecipeInputEn._(_root);
}

// Path: recipe.viewRecipe
class TranslationsRecipeViewRecipeEn {
  TranslationsRecipeViewRecipeEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Recipe';
  String get edit => 'Edit';
  String get delete => 'Delete';
}

// Path: recipe.common
class TranslationsRecipeCommonEn {
  TranslationsRecipeCommonEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get pickImage => 'Pick Image';
  String get saving => 'Saving...';
}

// Path: settings.general
class TranslationsSettingsGeneralEn {
  TranslationsSettingsGeneralEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get header => 'General';
  late final TranslationsSettingsGeneralRowEn row =
      TranslationsSettingsGeneralRowEn._(_root);
  late final TranslationsSettingsGeneralNotificationsEn notifications =
      TranslationsSettingsGeneralNotificationsEn._(_root);
}

// Path: settings.video
class TranslationsSettingsVideoEn {
  TranslationsSettingsVideoEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get header => 'Video';
  late final TranslationsSettingsVideoRowEn row =
      TranslationsSettingsVideoRowEn._(_root);
}

// Path: settings.support
class TranslationsSettingsSupportEn {
  TranslationsSettingsSupportEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get header => 'Support';
  late final TranslationsSettingsSupportRowEn row =
      TranslationsSettingsSupportRowEn._(_root);
}

// Path: settings.about
class TranslationsSettingsAboutEn {
  TranslationsSettingsAboutEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get header => 'About';
  late final TranslationsSettingsAboutRowEn row =
      TranslationsSettingsAboutRowEn._(_root);
}

// Path: settings.account
class TranslationsSettingsAccountEn {
  TranslationsSettingsAccountEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Account';
  late final TranslationsSettingsAccountDeleteEn delete =
      TranslationsSettingsAccountDeleteEn._(_root);
}

// Path: settings.debug
class TranslationsSettingsDebugEn {
  TranslationsSettingsDebugEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Debug';
  late final TranslationsSettingsDebugSectionsEn sections =
      TranslationsSettingsDebugSectionsEn._(_root);
}

// Path: settings.common
class TranslationsSettingsCommonEn {
  TranslationsSettingsCommonEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get selected => 'Selected';
}

// Path: error.auth
class TranslationsErrorAuthEn {
  TranslationsErrorAuthEn._(this._root);

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

// Path: error.storage
class TranslationsErrorStorageEn {
  TranslationsErrorStorageEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get unknown => 'Unknown error.';
  String get objectNotFound => 'Object not found.';
  String get bucketNotFound => 'Bucket not found.';
  String get projectNotFound => 'Project not found.';
  String get quotaExceeded => 'Quota exceeded.';
  String get unauthenticated => 'Unauthenticated.';
  String get unauthorized => 'Unauthorized.';
  String get retryLimitExceeded => 'Retry limit exceeded.';
  String get invalidChecksum => 'Invalid checksum.';
  String get canceled => 'Canceled.';
  String get invalidEventName => 'Invalid event name.';
  String get invalidUrl => 'Invalid URL.';
  String get invalidArgument => 'Invalid argument.';
  String get noDefaultBucket => 'No default bucket.';
  String get cannotSliceBlob => 'Cannot slice blob.';
  String get serverFileWrongSize => 'Server file wrong size.';
}

// Path: recipe.newRecipe.input
class TranslationsRecipeNewRecipeInputEn {
  TranslationsRecipeNewRecipeInputEn._(this._root);

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
class TranslationsSettingsGeneralRowEn {
  TranslationsSettingsGeneralRowEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  late final TranslationsSettingsGeneralRowThemeEn theme =
      TranslationsSettingsGeneralRowThemeEn._(_root);
  late final TranslationsSettingsGeneralRowColorEn color =
      TranslationsSettingsGeneralRowColorEn._(_root);
  late final TranslationsSettingsGeneralRowLanguageEn language =
      TranslationsSettingsGeneralRowLanguageEn._(_root);
}

// Path: settings.general.notifications
class TranslationsSettingsGeneralNotificationsEn {
  TranslationsSettingsGeneralNotificationsEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Notifications';
  late final TranslationsSettingsGeneralNotificationsPageEn page =
      TranslationsSettingsGeneralNotificationsPageEn._(_root);
}

// Path: settings.video.row
class TranslationsSettingsVideoRowEn {
  TranslationsSettingsVideoRowEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  late final TranslationsSettingsVideoRowPlayWithinAppEn playWithinApp =
      TranslationsSettingsVideoRowPlayWithinAppEn._(_root);
}

// Path: settings.support.row
class TranslationsSettingsSupportRowEn {
  TranslationsSettingsSupportRowEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  late final TranslationsSettingsSupportRowReviewEn review =
      TranslationsSettingsSupportRowReviewEn._(_root);
  late final TranslationsSettingsSupportRowShareEn share =
      TranslationsSettingsSupportRowShareEn._(_root);
  late final TranslationsSettingsSupportRowFeedbackEn feedback =
      TranslationsSettingsSupportRowFeedbackEn._(_root);
  late final TranslationsSettingsSupportRowContactEn contact =
      TranslationsSettingsSupportRowContactEn._(_root);
  late final TranslationsSettingsSupportRowHelpEn help =
      TranslationsSettingsSupportRowHelpEn._(_root);
}

// Path: settings.about.row
class TranslationsSettingsAboutRowEn {
  TranslationsSettingsAboutRowEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  late final TranslationsSettingsAboutRowTermsEn terms =
      TranslationsSettingsAboutRowTermsEn._(_root);
  late final TranslationsSettingsAboutRowPrivacyEn privacy =
      TranslationsSettingsAboutRowPrivacyEn._(_root);
  late final TranslationsSettingsAboutRowVersionEn version =
      TranslationsSettingsAboutRowVersionEn._(_root);
  late final TranslationsSettingsAboutRowLicenseEn license =
      TranslationsSettingsAboutRowLicenseEn._(_root);
}

// Path: settings.account.delete
class TranslationsSettingsAccountDeleteEn {
  TranslationsSettingsAccountDeleteEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Delete Account';
  String get description => 'Delete your account and all data';
}

// Path: settings.debug.sections
class TranslationsSettingsDebugSectionsEn {
  TranslationsSettingsDebugSectionsEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  late final TranslationsSettingsDebugSectionsGeneralEn general =
      TranslationsSettingsDebugSectionsGeneralEn._(_root);
  late final TranslationsSettingsDebugSectionsRecipeEn recipe =
      TranslationsSettingsDebugSectionsRecipeEn._(_root);
  late final TranslationsSettingsDebugSectionsFirebaseEn firebase =
      TranslationsSettingsDebugSectionsFirebaseEn._(_root);
}

// Path: settings.general.row.theme
class TranslationsSettingsGeneralRowThemeEn {
  TranslationsSettingsGeneralRowThemeEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Theme';
  late final TranslationsSettingsGeneralRowThemeThemeEn theme =
      TranslationsSettingsGeneralRowThemeThemeEn._(_root);
}

// Path: settings.general.row.color
class TranslationsSettingsGeneralRowColorEn {
  TranslationsSettingsGeneralRowColorEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Color';
  late final TranslationsSettingsGeneralRowColorColorEn color =
      TranslationsSettingsGeneralRowColorColorEn._(_root);
}

// Path: settings.general.row.language
class TranslationsSettingsGeneralRowLanguageEn {
  TranslationsSettingsGeneralRowLanguageEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Language';
  late final TranslationsSettingsGeneralRowLanguageLanguageEn language =
      TranslationsSettingsGeneralRowLanguageLanguageEn._(_root);
}

// Path: settings.general.notifications.page
class TranslationsSettingsGeneralNotificationsPageEn {
  TranslationsSettingsGeneralNotificationsPageEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Notifications';
  late final TranslationsSettingsGeneralNotificationsPageSettingsEn settings =
      TranslationsSettingsGeneralNotificationsPageSettingsEn._(_root);
  late final TranslationsSettingsGeneralNotificationsPageTopicEn topic =
      TranslationsSettingsGeneralNotificationsPageTopicEn._(_root);
}

// Path: settings.video.row.playWithinApp
class TranslationsSettingsVideoRowPlayWithinAppEn {
  TranslationsSettingsVideoRowPlayWithinAppEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Play within app';
  String get description => 'This platform does not support play within app';
}

// Path: settings.support.row.review
class TranslationsSettingsSupportRowReviewEn {
  TranslationsSettingsSupportRowReviewEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Review';
}

// Path: settings.support.row.share
class TranslationsSettingsSupportRowShareEn {
  TranslationsSettingsSupportRowShareEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Share';
}

// Path: settings.support.row.feedback
class TranslationsSettingsSupportRowFeedbackEn {
  TranslationsSettingsSupportRowFeedbackEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Feedback';
}

// Path: settings.support.row.contact
class TranslationsSettingsSupportRowContactEn {
  TranslationsSettingsSupportRowContactEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Contact';
}

// Path: settings.support.row.help
class TranslationsSettingsSupportRowHelpEn {
  TranslationsSettingsSupportRowHelpEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Help';
}

// Path: settings.about.row.terms
class TranslationsSettingsAboutRowTermsEn {
  TranslationsSettingsAboutRowTermsEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Terms';
}

// Path: settings.about.row.privacy
class TranslationsSettingsAboutRowPrivacyEn {
  TranslationsSettingsAboutRowPrivacyEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Privacy';
}

// Path: settings.about.row.version
class TranslationsSettingsAboutRowVersionEn {
  TranslationsSettingsAboutRowVersionEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Version';
}

// Path: settings.about.row.license
class TranslationsSettingsAboutRowLicenseEn {
  TranslationsSettingsAboutRowLicenseEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'License';
}

// Path: settings.debug.sections.general
class TranslationsSettingsDebugSectionsGeneralEn {
  TranslationsSettingsDebugSectionsGeneralEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'General';
  late final TranslationsSettingsDebugSectionsGeneralDeleteLocalDataEn
      deleteLocalData =
      TranslationsSettingsDebugSectionsGeneralDeleteLocalDataEn._(_root);
}

// Path: settings.debug.sections.recipe
class TranslationsSettingsDebugSectionsRecipeEn {
  TranslationsSettingsDebugSectionsRecipeEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Recipe';
  late final TranslationsSettingsDebugSectionsRecipeAddSampleRecipeEn
      addSampleRecipe =
      TranslationsSettingsDebugSectionsRecipeAddSampleRecipeEn._(_root);
  late final TranslationsSettingsDebugSectionsRecipeFirestoreCreateDataEn
      firestoreCreateData =
      TranslationsSettingsDebugSectionsRecipeFirestoreCreateDataEn._(_root);
}

// Path: settings.debug.sections.firebase
class TranslationsSettingsDebugSectionsFirebaseEn {
  TranslationsSettingsDebugSectionsFirebaseEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'General';
  late final TranslationsSettingsDebugSectionsFirebaseFirestoreDeleteDataEn
      firestoreDeleteData =
      TranslationsSettingsDebugSectionsFirebaseFirestoreDeleteDataEn._(_root);
  late final TranslationsSettingsDebugSectionsFirebaseAuthUidEn authUid =
      TranslationsSettingsDebugSectionsFirebaseAuthUidEn._(_root);
  late final TranslationsSettingsDebugSectionsFirebaseFcmTokenEn fcmToken =
      TranslationsSettingsDebugSectionsFirebaseFcmTokenEn._(_root);
  late final TranslationsSettingsDebugSectionsFirebaseInstallationIdEn
      installationId =
      TranslationsSettingsDebugSectionsFirebaseInstallationIdEn._(_root);
  late final TranslationsSettingsDebugSectionsFirebaseInstallationTokenEn
      installationToken =
      TranslationsSettingsDebugSectionsFirebaseInstallationTokenEn._(_root);
}

// Path: settings.general.row.theme.theme
class TranslationsSettingsGeneralRowThemeThemeEn {
  TranslationsSettingsGeneralRowThemeThemeEn._(this._root);

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
class TranslationsSettingsGeneralRowColorColorEn {
  TranslationsSettingsGeneralRowColorColorEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get header => 'Color';
}

// Path: settings.general.row.language.language
class TranslationsSettingsGeneralRowLanguageLanguageEn {
  TranslationsSettingsGeneralRowLanguageLanguageEn._(this._root);

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
class TranslationsSettingsGeneralNotificationsPageSettingsEn {
  TranslationsSettingsGeneralNotificationsPageSettingsEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Notifications';
  List<String> get items => [
        'Allow Notifications',
      ];
}

// Path: settings.general.notifications.page.topic
class TranslationsSettingsGeneralNotificationsPageTopicEn {
  TranslationsSettingsGeneralNotificationsPageTopicEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Topic';
  List<String> get items => [
        'General',
        'Video',
      ];
}

// Path: settings.debug.sections.general.deleteLocalData
class TranslationsSettingsDebugSectionsGeneralDeleteLocalDataEn {
  TranslationsSettingsDebugSectionsGeneralDeleteLocalDataEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Delete Shared Preferences';
}

// Path: settings.debug.sections.recipe.addSampleRecipe
class TranslationsSettingsDebugSectionsRecipeAddSampleRecipeEn {
  TranslationsSettingsDebugSectionsRecipeAddSampleRecipeEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Add Sample Recipe';
}

// Path: settings.debug.sections.recipe.firestoreCreateData
class TranslationsSettingsDebugSectionsRecipeFirestoreCreateDataEn {
  TranslationsSettingsDebugSectionsRecipeFirestoreCreateDataEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Create Many Dummy Data';
}

// Path: settings.debug.sections.firebase.firestoreDeleteData
class TranslationsSettingsDebugSectionsFirebaseFirestoreDeleteDataEn {
  TranslationsSettingsDebugSectionsFirebaseFirestoreDeleteDataEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Delete Data from Firestore';
}

// Path: settings.debug.sections.firebase.authUid
class TranslationsSettingsDebugSectionsFirebaseAuthUidEn {
  TranslationsSettingsDebugSectionsFirebaseAuthUidEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Copy Authenticated UID';
}

// Path: settings.debug.sections.firebase.fcmToken
class TranslationsSettingsDebugSectionsFirebaseFcmTokenEn {
  TranslationsSettingsDebugSectionsFirebaseFcmTokenEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Copy FCM Token';
}

// Path: settings.debug.sections.firebase.installationId
class TranslationsSettingsDebugSectionsFirebaseInstallationIdEn {
  TranslationsSettingsDebugSectionsFirebaseInstallationIdEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Copy Installation ID';
}

// Path: settings.debug.sections.firebase.installationToken
class TranslationsSettingsDebugSectionsFirebaseInstallationTokenEn {
  TranslationsSettingsDebugSectionsFirebaseInstallationTokenEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Copy Installation';
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
      case 'maintenance.title':
        return 'Maintenance';
      case 'maintenance.body':
        return 'We\'re currently performing\nmaintenance.';
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
      case 'recipe.common.pickImage':
        return 'Pick Image';
      case 'recipe.common.saving':
        return 'Saving...';
      case 'video.title':
        return 'Video';
      case 'video.refresh':
        return 'refresh';
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
      case 'settings.account.title':
        return 'Account';
      case 'settings.account.delete.title':
        return 'Delete Account';
      case 'settings.account.delete.description':
        return 'Delete your account and all data';
      case 'settings.debug.title':
        return 'Debug';
      case 'settings.debug.sections.general.title':
        return 'General';
      case 'settings.debug.sections.general.deleteLocalData.title':
        return 'Delete Shared Preferences';
      case 'settings.debug.sections.recipe.title':
        return 'Recipe';
      case 'settings.debug.sections.recipe.addSampleRecipe.title':
        return 'Add Sample Recipe';
      case 'settings.debug.sections.recipe.firestoreCreateData.title':
        return 'Create Many Dummy Data';
      case 'settings.debug.sections.firebase.title':
        return 'General';
      case 'settings.debug.sections.firebase.firestoreDeleteData.title':
        return 'Delete Data from Firestore';
      case 'settings.debug.sections.firebase.authUid.title':
        return 'Copy Authenticated UID';
      case 'settings.debug.sections.firebase.fcmToken.title':
        return 'Copy FCM Token';
      case 'settings.debug.sections.firebase.installationId.title':
        return 'Copy Installation ID';
      case 'settings.debug.sections.firebase.installationToken.title':
        return 'Copy Installation';
      case 'settings.common.selected':
        return 'Selected';
      case 'imagePicker.title':
        return 'Image Picker';
      case 'imagePicker.takePhoto':
        return 'Take Photo';
      case 'imagePicker.chooseFromLibrary':
        return 'Choose from Library';
      case 'imagePicker.noImageSelected':
        return 'No image selected';
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
      case 'common.cancel':
        return 'Cancel';
      case 'common.ok':
        return 'OK';
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
      case 'error.storage.unknown':
        return 'Unknown error.';
      case 'error.storage.objectNotFound':
        return 'Object not found.';
      case 'error.storage.bucketNotFound':
        return 'Bucket not found.';
      case 'error.storage.projectNotFound':
        return 'Project not found.';
      case 'error.storage.quotaExceeded':
        return 'Quota exceeded.';
      case 'error.storage.unauthenticated':
        return 'Unauthenticated.';
      case 'error.storage.unauthorized':
        return 'Unauthorized.';
      case 'error.storage.retryLimitExceeded':
        return 'Retry limit exceeded.';
      case 'error.storage.invalidChecksum':
        return 'Invalid checksum.';
      case 'error.storage.canceled':
        return 'Canceled.';
      case 'error.storage.invalidEventName':
        return 'Invalid event name.';
      case 'error.storage.invalidUrl':
        return 'Invalid URL.';
      case 'error.storage.invalidArgument':
        return 'Invalid argument.';
      case 'error.storage.noDefaultBucket':
        return 'No default bucket.';
      case 'error.storage.cannotSliceBlob':
        return 'Cannot slice blob.';
      case 'error.storage.serverFileWrongSize':
        return 'Server file wrong size.';
      default:
        return null;
    }
  }
}
