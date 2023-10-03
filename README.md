# buzz_recipe_viewer

[![check](https://github.com/yorifuji/buzz_recipe_viewer/actions/workflows/check.yml/badge.svg?branch=main)](https://github.com/yorifuji/buzz_recipe_viewer/actions/workflows/check.yml)

| light                         | dark                          |
| ----------------------------- | ----------------------------- |
| ![](./images/screenshot1.png) | ![](./images/screenshot2.png) |

# Architecture

```mermaid
graph LR;
    View-->|watch|Store
    View-->|call|Service
    Service-->|call|Repository
    Service-->|update|Store
```

- View
  - Widget など
- Store
  - 状態の保持
- Service
  - View の操作に基づいて処理を行う
    - 主にRepositoryに対する操作を行いデータを取得する
    - 取得したデータに基づいてStoreを更新する
- Repository
  - 外部サービス、API、データベースなどのデータソースからデータを取得

# Dependencies

- DI
  - [Riverpod](https://riverpod.dev/)
- Data store
  - [Isar Database](https://isar.dev/ja/)
  - [shared_preferences](https://pub.dev/packages/shared_preferences)
- UI
  - [youtube_player_flutter](https://pub.dev/packages/youtube_player_flutter)
  - [custom_text](https://pub.dev/packages/custom_text)
  - [settings_ui](https://pub.dev/packages/settings_ui)
  - [like_button](https://pub.dev/packages/like_button)
- i18n
  - [slang](https://pub.dev/packages/slang)
- Other
  - [freezed](https://pub.dev/packages/freezed)
  - [package_info_plus](https://pub.dev/packages/package_info_plus)
  - [flutter_dotenv](https://pub.dev/packages/flutter_dotenv)
  - [flutter_launcher_icons](https://pub.dev/packages/flutter_launcher_icons)
  - [url_launcher](https://pub.dev/packages/url_launcher)

# Dependency Management

- [Dependabot](https://docs.github.com/en/code-security/dependabot/working-with-dependabot)

# Backend

- [Algolia](https://www.algolia.com/)

# Data Source

- [YouTube Data API](https://developers.google.com/youtube/v3)

# Flavor

`--dart-define=FLAVOR=...` を採用

- dev
  - 開発用（ローカルビルド）
  - dev.yorifuji.buzz_recipe_viewer.dev
- stg
  - STG配布（Firebase App Distribution）
  - dev.yorifuji.buzz_recipe_viewer.stg
- prod
  - 本番配布
  - dev.yorifuji.buzz_recipe_viewer

# CI/CD

[GitHub Actions](https://github.co.jp/features/actions)を採用

- Check
  - flutter format
  - flutter analyze
  - flutter test
  - diffのチェック
- Bump
  - `version:`` のインクリメント
- Deliver(build & deploy)
  - stg
    - Firebase App Distribution
  - prod
    - Google Play, App Store Connect(Test Flight)
- Nightly build

# Related repository

- [yorifuji/buzz_recipe_importer](https://github.com/yorifuji/buzz_recipe_importer)
