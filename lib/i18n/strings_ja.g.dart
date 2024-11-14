///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'strings.g.dart';

// Path: <root>
class TranslationsJa implements Translations {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  TranslationsJa(
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

  late final TranslationsJa _root = this; // ignore: unused_field

  // Translations
  @override
  late final _TranslationsAppJa app = _TranslationsAppJa._(_root);
  @override
  late final _TranslationsTabJa tab = _TranslationsTabJa._(_root);
  @override
  late final _TranslationsMaintenanceJa maintenance =
      _TranslationsMaintenanceJa._(_root);
  @override
  late final _TranslationsWalkthroughJa walkthrough =
      _TranslationsWalkthroughJa._(_root);
  @override
  late final _TranslationsProvisioningJa provisioning =
      _TranslationsProvisioningJa._(_root);
  @override
  late final _TranslationsRecipeJa recipe = _TranslationsRecipeJa._(_root);
  @override
  late final _TranslationsVideoJa video = _TranslationsVideoJa._(_root);
  @override
  late final _TranslationsFavoriteJa favorite =
      _TranslationsFavoriteJa._(_root);
  @override
  late final _TranslationsSettingsJa settings =
      _TranslationsSettingsJa._(_root);
  @override
  late final _TranslationsImagePickerJa imagePicker =
      _TranslationsImagePickerJa._(_root);
  @override
  late final _TranslationsCommonJa common = _TranslationsCommonJa._(_root);
  @override
  late final _TranslationsErrorJa error = _TranslationsErrorJa._(_root);
}

// Path: app
class _TranslationsAppJa implements TranslationsAppEn {
  _TranslationsAppJa._(this._root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'シンプルレシピ検索';
}

// Path: tab
class _TranslationsTabJa implements TranslationsTabEn {
  _TranslationsTabJa._(this._root);

  final TranslationsJa _root; // ignore: unused_field

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

// Path: maintenance
class _TranslationsMaintenanceJa implements TranslationsMaintenanceEn {
  _TranslationsMaintenanceJa._(this._root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'メンテナンス';
  @override
  String get body => 'メンテナンス中です\nしばらくお待ちください';
}

// Path: walkthrough
class _TranslationsWalkthroughJa implements TranslationsWalkthroughEn {
  _TranslationsWalkthroughJa._(this._root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  late final _TranslationsWalkthroughIntro1Ja intro1 =
      _TranslationsWalkthroughIntro1Ja._(_root);
  @override
  late final _TranslationsWalkthroughIntro2Ja intro2 =
      _TranslationsWalkthroughIntro2Ja._(_root);
  @override
  late final _TranslationsWalkthroughIntro3Ja intro3 =
      _TranslationsWalkthroughIntro3Ja._(_root);
  @override
  String get skip => 'スキップ';
  @override
  String get done => '完了';
}

// Path: provisioning
class _TranslationsProvisioningJa implements TranslationsProvisioningEn {
  _TranslationsProvisioningJa._(this._root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get provisioning => 'アカウントを準備しています...';
  @override
  String get retry => '再試行';
}

// Path: recipe
class _TranslationsRecipeJa implements TranslationsRecipeEn {
  _TranslationsRecipeJa._(this._root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'レシピ';
  @override
  String get empty => 'レシピが登録されていません\n新しいレシピを登録しましょう！';
  @override
  String get addRecipe => 'レシピを追加';
  @override
  late final _TranslationsRecipeNewRecipeJa newRecipe =
      _TranslationsRecipeNewRecipeJa._(_root);
  @override
  late final _TranslationsRecipeViewRecipeJa viewRecipe =
      _TranslationsRecipeViewRecipeJa._(_root);
  @override
  late final _TranslationsRecipeCommonJa common =
      _TranslationsRecipeCommonJa._(_root);
}

// Path: video
class _TranslationsVideoJa implements TranslationsVideoEn {
  _TranslationsVideoJa._(this._root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => '動画';
  @override
  String get refresh => '更新';
}

// Path: favorite
class _TranslationsFavoriteJa implements TranslationsFavoriteEn {
  _TranslationsFavoriteJa._(this._root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'お気に入り';
  @override
  String get empty => '動画をお気に入りに追加しよう！';
}

// Path: settings
class _TranslationsSettingsJa implements TranslationsSettingsEn {
  _TranslationsSettingsJa._(this._root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => '設定';
  @override
  late final _TranslationsSettingsGeneralJa general =
      _TranslationsSettingsGeneralJa._(_root);
  @override
  late final _TranslationsSettingsVideoJa video =
      _TranslationsSettingsVideoJa._(_root);
  @override
  late final _TranslationsSettingsSupportJa support =
      _TranslationsSettingsSupportJa._(_root);
  @override
  late final _TranslationsSettingsAboutJa about =
      _TranslationsSettingsAboutJa._(_root);
  @override
  late final _TranslationsSettingsAccountJa account =
      _TranslationsSettingsAccountJa._(_root);
  @override
  late final _TranslationsSettingsDebugJa debug =
      _TranslationsSettingsDebugJa._(_root);
  @override
  late final _TranslationsSettingsCommonJa common =
      _TranslationsSettingsCommonJa._(_root);
}

// Path: imagePicker
class _TranslationsImagePickerJa implements TranslationsImagePickerEn {
  _TranslationsImagePickerJa._(this._root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => '画像選択';
  @override
  String get takePhoto => '写真を撮る';
  @override
  String get chooseFromLibrary => 'ライブラリから選択';
  @override
  String get noImageSelected => '画像が選択されていません';
}

// Path: common
class _TranslationsCommonJa implements TranslationsCommonEn {
  _TranslationsCommonJa._(this._root);

  final TranslationsJa _root; // ignore: unused_field

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
  String get searchQuery => '検索ワード（例：から揚げ ナス）';
  @override
  String get sortByDate => '登録日（新しい順）';
  @override
  String get sortByLikes => '人気順（いいね）';
  @override
  String get sortByViews => '人気順（閲覧数）';
  @override
  String get selected => '選択中';
  @override
  String get cancel => 'キャンセル';
  @override
  String get ok => 'OK';
}

// Path: error
class _TranslationsErrorJa implements TranslationsErrorEn {
  _TranslationsErrorJa._(this._root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  late final _TranslationsErrorAuthJa auth = _TranslationsErrorAuthJa._(_root);
  @override
  late final _TranslationsErrorStorageJa storage =
      _TranslationsErrorStorageJa._(_root);
}

// Path: walkthrough.intro1
class _TranslationsWalkthroughIntro1Ja
    implements TranslationsWalkthroughIntro1En {
  _TranslationsWalkthroughIntro1Ja._(this._root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => '美味しい毎日を';
  @override
  String get body => 'あなただけのレシピブックを作ろう';
}

// Path: walkthrough.intro2
class _TranslationsWalkthroughIntro2Ja
    implements TranslationsWalkthroughIntro2En {
  _TranslationsWalkthroughIntro2Ja._(this._root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => '手順を学ぼう';
  @override
  String get body => 'プロのコツで、いつもの料理をワンランクアップ';
}

// Path: walkthrough.intro3
class _TranslationsWalkthroughIntro3Ja
    implements TranslationsWalkthroughIntro3En {
  _TranslationsWalkthroughIntro3Ja._(this._root);

  final TranslationsJa _root; // ignore: unused_field

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
class _TranslationsRecipeNewRecipeJa implements TranslationsRecipeNewRecipeEn {
  _TranslationsRecipeNewRecipeJa._(this._root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => '新しいレシピ';
  @override
  late final _TranslationsRecipeNewRecipeInputJa input =
      _TranslationsRecipeNewRecipeInputJa._(_root);
}

// Path: recipe.viewRecipe
class _TranslationsRecipeViewRecipeJa
    implements TranslationsRecipeViewRecipeEn {
  _TranslationsRecipeViewRecipeJa._(this._root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'レシピ';
  @override
  String get edit => '編集';
  @override
  String get delete => '削除';
}

// Path: recipe.common
class _TranslationsRecipeCommonJa implements TranslationsRecipeCommonEn {
  _TranslationsRecipeCommonJa._(this._root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get pickImage => '画像を選択';
  @override
  String get saving => '保存中...';
}

// Path: settings.general
class _TranslationsSettingsGeneralJa implements TranslationsSettingsGeneralEn {
  _TranslationsSettingsGeneralJa._(this._root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get header => '一般';
  @override
  late final _TranslationsSettingsGeneralRowJa row =
      _TranslationsSettingsGeneralRowJa._(_root);
  @override
  late final _TranslationsSettingsGeneralNotificationsJa notifications =
      _TranslationsSettingsGeneralNotificationsJa._(_root);
}

// Path: settings.video
class _TranslationsSettingsVideoJa implements TranslationsSettingsVideoEn {
  _TranslationsSettingsVideoJa._(this._root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get header => '動画';
  @override
  late final _TranslationsSettingsVideoRowJa row =
      _TranslationsSettingsVideoRowJa._(_root);
}

// Path: settings.support
class _TranslationsSettingsSupportJa implements TranslationsSettingsSupportEn {
  _TranslationsSettingsSupportJa._(this._root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get header => 'サポート';
  @override
  late final _TranslationsSettingsSupportRowJa row =
      _TranslationsSettingsSupportRowJa._(_root);
}

// Path: settings.about
class _TranslationsSettingsAboutJa implements TranslationsSettingsAboutEn {
  _TranslationsSettingsAboutJa._(this._root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get header => 'このアプリについて';
  @override
  late final _TranslationsSettingsAboutRowJa row =
      _TranslationsSettingsAboutRowJa._(_root);
}

// Path: settings.account
class _TranslationsSettingsAccountJa implements TranslationsSettingsAccountEn {
  _TranslationsSettingsAccountJa._(this._root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'アカウント';
  @override
  late final _TranslationsSettingsAccountDeleteJa delete =
      _TranslationsSettingsAccountDeleteJa._(_root);
}

// Path: settings.debug
class _TranslationsSettingsDebugJa implements TranslationsSettingsDebugEn {
  _TranslationsSettingsDebugJa._(this._root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'デバッグ';
  @override
  late final _TranslationsSettingsDebugSectionsJa sections =
      _TranslationsSettingsDebugSectionsJa._(_root);
}

// Path: settings.common
class _TranslationsSettingsCommonJa implements TranslationsSettingsCommonEn {
  _TranslationsSettingsCommonJa._(this._root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get selected => '選択中';
}

// Path: error.auth
class _TranslationsErrorAuthJa implements TranslationsErrorAuthEn {
  _TranslationsErrorAuthJa._(this._root);

  final TranslationsJa _root; // ignore: unused_field

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

// Path: error.storage
class _TranslationsErrorStorageJa implements TranslationsErrorStorageEn {
  _TranslationsErrorStorageJa._(this._root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get unknown => '不明なエラーが発生しました';
  @override
  String get objectNotFound => 'オブジェクトが見つかりません';
  @override
  String get bucketNotFound => 'バケットが見つかりません';
  @override
  String get projectNotFound => 'プロジェクトが見つかりません';
  @override
  String get quotaExceeded => 'クォータが超過しました';
  @override
  String get unauthenticated => '認証されていません';
  @override
  String get unauthorized => '権限がありません';
  @override
  String get retryLimitExceeded => 'リトライ回数が超過しました';
  @override
  String get invalidChecksum => 'チェックサムが無効です';
  @override
  String get canceled => 'キャンセルされました';
  @override
  String get invalidEventName => 'イベント名が無効です';
  @override
  String get invalidUrl => 'URLが無効です';
  @override
  String get invalidArgument => '引数が無効です';
  @override
  String get noDefaultBucket => 'デフォルトバケットがありません';
  @override
  String get cannotSliceBlob => 'ブロブをスライスできません';
  @override
  String get serverFileWrongSize => 'サーバーファイルのサイズが異なります';
}

// Path: recipe.newRecipe.input
class _TranslationsRecipeNewRecipeInputJa
    implements TranslationsRecipeNewRecipeInputEn {
  _TranslationsRecipeNewRecipeInputJa._(this._root);

  final TranslationsJa _root; // ignore: unused_field

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
class _TranslationsSettingsGeneralRowJa
    implements TranslationsSettingsGeneralRowEn {
  _TranslationsSettingsGeneralRowJa._(this._root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  late final _TranslationsSettingsGeneralRowThemeJa theme =
      _TranslationsSettingsGeneralRowThemeJa._(_root);
  @override
  late final _TranslationsSettingsGeneralRowColorJa color =
      _TranslationsSettingsGeneralRowColorJa._(_root);
  @override
  late final _TranslationsSettingsGeneralRowLanguageJa language =
      _TranslationsSettingsGeneralRowLanguageJa._(_root);
}

// Path: settings.general.notifications
class _TranslationsSettingsGeneralNotificationsJa
    implements TranslationsSettingsGeneralNotificationsEn {
  _TranslationsSettingsGeneralNotificationsJa._(this._root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => '通知設定';
  @override
  late final _TranslationsSettingsGeneralNotificationsPageJa page =
      _TranslationsSettingsGeneralNotificationsPageJa._(_root);
}

// Path: settings.video.row
class _TranslationsSettingsVideoRowJa
    implements TranslationsSettingsVideoRowEn {
  _TranslationsSettingsVideoRowJa._(this._root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  late final _TranslationsSettingsVideoRowPlayWithinAppJa playWithinApp =
      _TranslationsSettingsVideoRowPlayWithinAppJa._(_root);
}

// Path: settings.support.row
class _TranslationsSettingsSupportRowJa
    implements TranslationsSettingsSupportRowEn {
  _TranslationsSettingsSupportRowJa._(this._root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  late final _TranslationsSettingsSupportRowReviewJa review =
      _TranslationsSettingsSupportRowReviewJa._(_root);
  @override
  late final _TranslationsSettingsSupportRowShareJa share =
      _TranslationsSettingsSupportRowShareJa._(_root);
  @override
  late final _TranslationsSettingsSupportRowFeedbackJa feedback =
      _TranslationsSettingsSupportRowFeedbackJa._(_root);
  @override
  late final _TranslationsSettingsSupportRowContactJa contact =
      _TranslationsSettingsSupportRowContactJa._(_root);
  @override
  late final _TranslationsSettingsSupportRowHelpJa help =
      _TranslationsSettingsSupportRowHelpJa._(_root);
}

// Path: settings.about.row
class _TranslationsSettingsAboutRowJa
    implements TranslationsSettingsAboutRowEn {
  _TranslationsSettingsAboutRowJa._(this._root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  late final _TranslationsSettingsAboutRowTermsJa terms =
      _TranslationsSettingsAboutRowTermsJa._(_root);
  @override
  late final _TranslationsSettingsAboutRowPrivacyJa privacy =
      _TranslationsSettingsAboutRowPrivacyJa._(_root);
  @override
  late final _TranslationsSettingsAboutRowVersionJa version =
      _TranslationsSettingsAboutRowVersionJa._(_root);
  @override
  late final _TranslationsSettingsAboutRowLicenseJa license =
      _TranslationsSettingsAboutRowLicenseJa._(_root);
}

// Path: settings.account.delete
class _TranslationsSettingsAccountDeleteJa
    implements TranslationsSettingsAccountDeleteEn {
  _TranslationsSettingsAccountDeleteJa._(this._root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'アカウントを削除';
  @override
  String get description => 'アカウントとデータを削除します';
}

// Path: settings.debug.sections
class _TranslationsSettingsDebugSectionsJa
    implements TranslationsSettingsDebugSectionsEn {
  _TranslationsSettingsDebugSectionsJa._(this._root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  late final _TranslationsSettingsDebugSectionsGeneralJa general =
      _TranslationsSettingsDebugSectionsGeneralJa._(_root);
  @override
  late final _TranslationsSettingsDebugSectionsRecipeJa recipe =
      _TranslationsSettingsDebugSectionsRecipeJa._(_root);
  @override
  late final _TranslationsSettingsDebugSectionsFirebaseJa firebase =
      _TranslationsSettingsDebugSectionsFirebaseJa._(_root);
}

// Path: settings.general.row.theme
class _TranslationsSettingsGeneralRowThemeJa
    implements TranslationsSettingsGeneralRowThemeEn {
  _TranslationsSettingsGeneralRowThemeJa._(this._root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'テーマ';
  @override
  late final _TranslationsSettingsGeneralRowThemeThemeJa theme =
      _TranslationsSettingsGeneralRowThemeThemeJa._(_root);
}

// Path: settings.general.row.color
class _TranslationsSettingsGeneralRowColorJa
    implements TranslationsSettingsGeneralRowColorEn {
  _TranslationsSettingsGeneralRowColorJa._(this._root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'カラー';
  @override
  late final _TranslationsSettingsGeneralRowColorColorJa color =
      _TranslationsSettingsGeneralRowColorColorJa._(_root);
}

// Path: settings.general.row.language
class _TranslationsSettingsGeneralRowLanguageJa
    implements TranslationsSettingsGeneralRowLanguageEn {
  _TranslationsSettingsGeneralRowLanguageJa._(this._root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => '言語';
  @override
  late final _TranslationsSettingsGeneralRowLanguageLanguageJa language =
      _TranslationsSettingsGeneralRowLanguageLanguageJa._(_root);
}

// Path: settings.general.notifications.page
class _TranslationsSettingsGeneralNotificationsPageJa
    implements TranslationsSettingsGeneralNotificationsPageEn {
  _TranslationsSettingsGeneralNotificationsPageJa._(this._root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => '通知設定';
  @override
  late final _TranslationsSettingsGeneralNotificationsPageSettingsJa settings =
      _TranslationsSettingsGeneralNotificationsPageSettingsJa._(_root);
  @override
  late final _TranslationsSettingsGeneralNotificationsPageTopicJa topic =
      _TranslationsSettingsGeneralNotificationsPageTopicJa._(_root);
}

// Path: settings.video.row.playWithinApp
class _TranslationsSettingsVideoRowPlayWithinAppJa
    implements TranslationsSettingsVideoRowPlayWithinAppEn {
  _TranslationsSettingsVideoRowPlayWithinAppJa._(this._root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'アプリ内で再生する';
  @override
  String get description => 'このプラットフォームはアプリ内再生をサポートしていません';
}

// Path: settings.support.row.review
class _TranslationsSettingsSupportRowReviewJa
    implements TranslationsSettingsSupportRowReviewEn {
  _TranslationsSettingsSupportRowReviewJa._(this._root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'レビュー';
}

// Path: settings.support.row.share
class _TranslationsSettingsSupportRowShareJa
    implements TranslationsSettingsSupportRowShareEn {
  _TranslationsSettingsSupportRowShareJa._(this._root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'シェア';
}

// Path: settings.support.row.feedback
class _TranslationsSettingsSupportRowFeedbackJa
    implements TranslationsSettingsSupportRowFeedbackEn {
  _TranslationsSettingsSupportRowFeedbackJa._(this._root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'フィードバック';
}

// Path: settings.support.row.contact
class _TranslationsSettingsSupportRowContactJa
    implements TranslationsSettingsSupportRowContactEn {
  _TranslationsSettingsSupportRowContactJa._(this._root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'お問い合わせ';
}

// Path: settings.support.row.help
class _TranslationsSettingsSupportRowHelpJa
    implements TranslationsSettingsSupportRowHelpEn {
  _TranslationsSettingsSupportRowHelpJa._(this._root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ヘルプ';
}

// Path: settings.about.row.terms
class _TranslationsSettingsAboutRowTermsJa
    implements TranslationsSettingsAboutRowTermsEn {
  _TranslationsSettingsAboutRowTermsJa._(this._root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => '利用規約';
}

// Path: settings.about.row.privacy
class _TranslationsSettingsAboutRowPrivacyJa
    implements TranslationsSettingsAboutRowPrivacyEn {
  _TranslationsSettingsAboutRowPrivacyJa._(this._root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'プライバシーポリシー';
}

// Path: settings.about.row.version
class _TranslationsSettingsAboutRowVersionJa
    implements TranslationsSettingsAboutRowVersionEn {
  _TranslationsSettingsAboutRowVersionJa._(this._root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'バージョン';
}

// Path: settings.about.row.license
class _TranslationsSettingsAboutRowLicenseJa
    implements TranslationsSettingsAboutRowLicenseEn {
  _TranslationsSettingsAboutRowLicenseJa._(this._root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'ライセンス';
}

// Path: settings.debug.sections.general
class _TranslationsSettingsDebugSectionsGeneralJa
    implements TranslationsSettingsDebugSectionsGeneralEn {
  _TranslationsSettingsDebugSectionsGeneralJa._(this._root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => '一般';
  @override
  late final _TranslationsSettingsDebugSectionsGeneralDeleteLocalDataJa
      deleteLocalData =
      _TranslationsSettingsDebugSectionsGeneralDeleteLocalDataJa._(_root);
}

// Path: settings.debug.sections.recipe
class _TranslationsSettingsDebugSectionsRecipeJa
    implements TranslationsSettingsDebugSectionsRecipeEn {
  _TranslationsSettingsDebugSectionsRecipeJa._(this._root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'レシピ';
  @override
  late final _TranslationsSettingsDebugSectionsRecipeAddSampleRecipeJa
      addSampleRecipe =
      _TranslationsSettingsDebugSectionsRecipeAddSampleRecipeJa._(_root);
  @override
  late final _TranslationsSettingsDebugSectionsRecipeFirestoreCreateDataJa
      firestoreCreateData =
      _TranslationsSettingsDebugSectionsRecipeFirestoreCreateDataJa._(_root);
}

// Path: settings.debug.sections.firebase
class _TranslationsSettingsDebugSectionsFirebaseJa
    implements TranslationsSettingsDebugSectionsFirebaseEn {
  _TranslationsSettingsDebugSectionsFirebaseJa._(this._root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Firebase';
  @override
  late final _TranslationsSettingsDebugSectionsFirebaseFirestoreDeleteDataJa
      firestoreDeleteData =
      _TranslationsSettingsDebugSectionsFirebaseFirestoreDeleteDataJa._(_root);
  @override
  late final _TranslationsSettingsDebugSectionsFirebaseAuthUidJa authUid =
      _TranslationsSettingsDebugSectionsFirebaseAuthUidJa._(_root);
  @override
  late final _TranslationsSettingsDebugSectionsFirebaseFcmTokenJa fcmToken =
      _TranslationsSettingsDebugSectionsFirebaseFcmTokenJa._(_root);
  @override
  late final _TranslationsSettingsDebugSectionsFirebaseInstallationIdJa
      installationId =
      _TranslationsSettingsDebugSectionsFirebaseInstallationIdJa._(_root);
  @override
  late final _TranslationsSettingsDebugSectionsFirebaseInstallationTokenJa
      installationToken =
      _TranslationsSettingsDebugSectionsFirebaseInstallationTokenJa._(_root);
}

// Path: settings.general.row.theme.theme
class _TranslationsSettingsGeneralRowThemeThemeJa
    implements TranslationsSettingsGeneralRowThemeThemeEn {
  _TranslationsSettingsGeneralRowThemeThemeJa._(this._root);

  final TranslationsJa _root; // ignore: unused_field

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
class _TranslationsSettingsGeneralRowColorColorJa
    implements TranslationsSettingsGeneralRowColorColorEn {
  _TranslationsSettingsGeneralRowColorColorJa._(this._root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get header => 'カラー';
}

// Path: settings.general.row.language.language
class _TranslationsSettingsGeneralRowLanguageLanguageJa
    implements TranslationsSettingsGeneralRowLanguageLanguageEn {
  _TranslationsSettingsGeneralRowLanguageLanguageJa._(this._root);

  final TranslationsJa _root; // ignore: unused_field

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
class _TranslationsSettingsGeneralNotificationsPageSettingsJa
    implements TranslationsSettingsGeneralNotificationsPageSettingsEn {
  _TranslationsSettingsGeneralNotificationsPageSettingsJa._(this._root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => '通知';
  @override
  List<String> get items => [
        '通知を許可',
      ];
}

// Path: settings.general.notifications.page.topic
class _TranslationsSettingsGeneralNotificationsPageTopicJa
    implements TranslationsSettingsGeneralNotificationsPageTopicEn {
  _TranslationsSettingsGeneralNotificationsPageTopicJa._(this._root);

  final TranslationsJa _root; // ignore: unused_field

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
class _TranslationsSettingsDebugSectionsGeneralDeleteLocalDataJa
    implements TranslationsSettingsDebugSectionsGeneralDeleteLocalDataEn {
  _TranslationsSettingsDebugSectionsGeneralDeleteLocalDataJa._(this._root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Shared Preferencesを削除';
}

// Path: settings.debug.sections.recipe.addSampleRecipe
class _TranslationsSettingsDebugSectionsRecipeAddSampleRecipeJa
    implements TranslationsSettingsDebugSectionsRecipeAddSampleRecipeEn {
  _TranslationsSettingsDebugSectionsRecipeAddSampleRecipeJa._(this._root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'サンプルレシピを追加';
}

// Path: settings.debug.sections.recipe.firestoreCreateData
class _TranslationsSettingsDebugSectionsRecipeFirestoreCreateDataJa
    implements TranslationsSettingsDebugSectionsRecipeFirestoreCreateDataEn {
  _TranslationsSettingsDebugSectionsRecipeFirestoreCreateDataJa._(this._root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => '大量データの追加';
}

// Path: settings.debug.sections.firebase.firestoreDeleteData
class _TranslationsSettingsDebugSectionsFirebaseFirestoreDeleteDataJa
    implements TranslationsSettingsDebugSectionsFirebaseFirestoreDeleteDataEn {
  _TranslationsSettingsDebugSectionsFirebaseFirestoreDeleteDataJa._(this._root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Firestoreのデータを削除';
}

// Path: settings.debug.sections.firebase.authUid
class _TranslationsSettingsDebugSectionsFirebaseAuthUidJa
    implements TranslationsSettingsDebugSectionsFirebaseAuthUidEn {
  _TranslationsSettingsDebugSectionsFirebaseAuthUidJa._(this._root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Authentication UIDをコピー';
}

// Path: settings.debug.sections.firebase.fcmToken
class _TranslationsSettingsDebugSectionsFirebaseFcmTokenJa
    implements TranslationsSettingsDebugSectionsFirebaseFcmTokenEn {
  _TranslationsSettingsDebugSectionsFirebaseFcmTokenJa._(this._root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'FCMトークンをコピー';
}

// Path: settings.debug.sections.firebase.installationId
class _TranslationsSettingsDebugSectionsFirebaseInstallationIdJa
    implements TranslationsSettingsDebugSectionsFirebaseInstallationIdEn {
  _TranslationsSettingsDebugSectionsFirebaseInstallationIdJa._(this._root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Installation IDをコピー';
}

// Path: settings.debug.sections.firebase.installationToken
class _TranslationsSettingsDebugSectionsFirebaseInstallationTokenJa
    implements TranslationsSettingsDebugSectionsFirebaseInstallationTokenEn {
  _TranslationsSettingsDebugSectionsFirebaseInstallationTokenJa._(this._root);

  final TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Installation Tokenをコピー';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on TranslationsJa {
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
      case 'maintenance.title':
        return 'メンテナンス';
      case 'maintenance.body':
        return 'メンテナンス中です\nしばらくお待ちください';
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
      case 'recipe.common.pickImage':
        return '画像を選択';
      case 'recipe.common.saving':
        return '保存中...';
      case 'video.title':
        return '動画';
      case 'video.refresh':
        return '更新';
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
      case 'settings.account.title':
        return 'アカウント';
      case 'settings.account.delete.title':
        return 'アカウントを削除';
      case 'settings.account.delete.description':
        return 'アカウントとデータを削除します';
      case 'settings.debug.title':
        return 'デバッグ';
      case 'settings.debug.sections.general.title':
        return '一般';
      case 'settings.debug.sections.general.deleteLocalData.title':
        return 'Shared Preferencesを削除';
      case 'settings.debug.sections.recipe.title':
        return 'レシピ';
      case 'settings.debug.sections.recipe.addSampleRecipe.title':
        return 'サンプルレシピを追加';
      case 'settings.debug.sections.recipe.firestoreCreateData.title':
        return '大量データの追加';
      case 'settings.debug.sections.firebase.title':
        return 'Firebase';
      case 'settings.debug.sections.firebase.firestoreDeleteData.title':
        return 'Firestoreのデータを削除';
      case 'settings.debug.sections.firebase.authUid.title':
        return 'Authentication UIDをコピー';
      case 'settings.debug.sections.firebase.fcmToken.title':
        return 'FCMトークンをコピー';
      case 'settings.debug.sections.firebase.installationId.title':
        return 'Installation IDをコピー';
      case 'settings.debug.sections.firebase.installationToken.title':
        return 'Installation Tokenをコピー';
      case 'settings.common.selected':
        return '選択中';
      case 'imagePicker.title':
        return '画像選択';
      case 'imagePicker.takePhoto':
        return '写真を撮る';
      case 'imagePicker.chooseFromLibrary':
        return 'ライブラリから選択';
      case 'imagePicker.noImageSelected':
        return '画像が選択されていません';
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
        return '検索ワード（例：から揚げ ナス）';
      case 'common.sortByDate':
        return '登録日（新しい順）';
      case 'common.sortByLikes':
        return '人気順（いいね）';
      case 'common.sortByViews':
        return '人気順（閲覧数）';
      case 'common.selected':
        return '選択中';
      case 'common.cancel':
        return 'キャンセル';
      case 'common.ok':
        return 'OK';
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
      case 'error.storage.unknown':
        return '不明なエラーが発生しました';
      case 'error.storage.objectNotFound':
        return 'オブジェクトが見つかりません';
      case 'error.storage.bucketNotFound':
        return 'バケットが見つかりません';
      case 'error.storage.projectNotFound':
        return 'プロジェクトが見つかりません';
      case 'error.storage.quotaExceeded':
        return 'クォータが超過しました';
      case 'error.storage.unauthenticated':
        return '認証されていません';
      case 'error.storage.unauthorized':
        return '権限がありません';
      case 'error.storage.retryLimitExceeded':
        return 'リトライ回数が超過しました';
      case 'error.storage.invalidChecksum':
        return 'チェックサムが無効です';
      case 'error.storage.canceled':
        return 'キャンセルされました';
      case 'error.storage.invalidEventName':
        return 'イベント名が無効です';
      case 'error.storage.invalidUrl':
        return 'URLが無効です';
      case 'error.storage.invalidArgument':
        return '引数が無効です';
      case 'error.storage.noDefaultBucket':
        return 'デフォルトバケットがありません';
      case 'error.storage.cannotSliceBlob':
        return 'ブロブをスライスできません';
      case 'error.storage.serverFileWrongSize':
        return 'サーバーファイルのサイズが異なります';
      default:
        return null;
    }
  }
}
