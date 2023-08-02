# buzz_recipe_viewer

[![check](https://github.com/yorifuji/buzz_recipe_viewer/actions/workflows/check.yml/badge.svg?branch=main)](https://github.com/yorifuji/buzz_recipe_viewer/actions/workflows/check.yml)

| light                         | dark                          |
| ----------------------------- | ----------------------------- |
| ![](./images/screenshot1.png) | ![](./images/screenshot2.png) |

# Architecture

- Flutter
  - MVVM + Repository
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
- Backend
  - [Algolia](https://www.algolia.com/)
- Data Source
  - [YouTube Data API](https://developers.google.com/youtube/v3)
- CI/CD
  - [GitHub Actions](https://github.co.jp/features/actions)

# Related repository

- [yorifuji/buzz_recipe_importer](https://github.com/yorifuji/buzz_recipe_importer)
