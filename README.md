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
  - Database
    - [Isar Database](https://isar.dev/ja/)
    - [shared_preferences | Flutter Package](https://pub.dev/packages/shared_preferences)
  - Model
    - [freezed | Dart Package](https://pub.dev/packages/freezed)
  - UI
    - [youtube_player_flutter | Flutter Package](https://pub.dev/packages/youtube_player_flutter)
    - [like_button | Flutter Package](https://pub.dev/packages/like_button)
    - [custom_text | Flutter Package](https://pub.dev/packages/custom_text)
    - [settings_ui | Flutter Package](https://pub.dev/packages/settings_ui)
  - Other
    - [package_info_plus | Flutter Package](https://pub.dev/packages/package_info_plus)
- Backend
  - [Algolia](https://www.algolia.com/)
- Data Source
  - [YouTube Data API](https://developers.google.com/youtube/v3)
- CI/CD
  - [GitHub Actions](https://github.com/yorifuji/buzz_recipe_viewer/actions)

# Related repository

- [yorifuji/buzz_recipe_importer](https://github.com/yorifuji/buzz_recipe_importer)
