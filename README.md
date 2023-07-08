# buzz_recipe_viewer

[![check](https://github.com/yorifuji/buzz_recipe_viewer/actions/workflows/check.yml/badge.svg?branch=main)](https://github.com/yorifuji/buzz_recipe_viewer/actions/workflows/check.yml)

| light                         | dark                          |
| ----------------------------- | ----------------------------- |
| ![](./images/screenshot1.png) | ![](./images/screenshot2.png) |

# Architecture

- Flutter
  - MVVM + Repository
  - Dependencies
    - [Riverpod](https://riverpod.dev/)
    - [Isar Database](https://isar.dev/ja/)
    - [freezed | Dart Package](https://pub.dev/packages/freezed)
    - [youtube_player_flutter | Flutter Package](https://pub.dev/packages/youtube_player_flutter)
    - [settings_ui | Flutter Package](https://pub.dev/packages/settings_ui)
    - [package_info_plus | Flutter Package](https://pub.dev/packages/package_info_plus)
    - [shared_preferences | Flutter Package](https://pub.dev/packages/shared_preferences)
- Backend
  - [Algolia](https://www.algolia.com/)
- Data Source
  - [YouTube Data API](https://developers.google.com/youtube/v3)
- CI/CD
  - GitHub Actions

# Related repository

- [yorifuji/buzz_recipe_importer](https://github.com/yorifuji/buzz_recipe_importer)
