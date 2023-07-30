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
  - Model
    - [freezed](https://pub.dev/packages/freezed)
  - UI
    - [youtube_player_flutter](https://pub.dev/packages/youtube_player_flutter)
    - [settings_ui](https://pub.dev/packages/settings_ui)
    - [like_button](https://pub.dev/packages/like_button)
  - Other
    - [package_info_plus](https://pub.dev/packages/package_info_plus)
- Backend
  - [Algolia](https://www.algolia.com/)
- Data Source
  - [YouTube Data API](https://developers.google.com/youtube/v3)
- CI/CD
  - [GitHub Actions](https://github.co.jp/features/actions)

# Related repository

- [yorifuji/buzz_recipe_importer](https://github.com/yorifuji/buzz_recipe_importer)
