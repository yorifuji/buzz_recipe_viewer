# buzz_recipe_viewer

[![check](https://github.com/yorifuji/buzz_recipe_viewer/actions/workflows/check.yml/badge.svg?branch=main)](https://github.com/yorifuji/buzz_recipe_viewer/actions/workflows/check.yml)

| screenshot1                   | screenshot2                   |
| ----------------------------- | ----------------------------- |
| ![](./images/screenshot1.png) | ![](./images/screenshot2.png) |

# Architecture

- Flutter
  - MVVM + Repository
  - Dependencies
    - [Riverpod](https://riverpod.dev/)
    - [freezed](https://pub.dev/packages/freezed)
    - [Isar Database](https://isar.dev/ja/)
- Backend
  - [Algolia](https://www.algolia.com/)
- Data Source
  - [YouTube Data API](https://developers.google.com/youtube/v3)
- CI/CD
  - GitHub Actions
