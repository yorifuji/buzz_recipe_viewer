.PHONY: prepare-env
prepare-env:
	test -e .env || cp .env_example .env

.PHONY: build-runner
build-runner:
	test -e .env || cp .env_example .env
	flutter pub get && dart run build_runner build -d && dart format -l 80 lib/i18n

.PHONY: build-launcher-icons
build-launcher-icons:
	flutter pub run flutter_launcher_icons:main

.PHONY: update-goldens
update-goldens:
	flutter test --update-goldens --tags=golden

# Firebase

.PHONY: firebase-configure
firebase-configure-stg:
	flutterfire configure \
		--yes \
		--project=buzzrecipeviewer-stg \
		--platforms=android,ios \
		--ios-bundle-id=dev.yorifuji.buzzRecipeViewer.stg \
		--android-package-name=dev.yorifuji.buzz_recipe_viewer.stg

.PHONY: firebase-configure-prod
firebase-configure-prod:
	flutterfire configure \
		--yes \
		--project=buzzrecipeviewer \
		--platforms=android,ios \
		--ios-bundle-id=dev.yorifuji.buzzRecipeViewer \
		--android-package-name=dev.yorifuji.buzz_recipe_viewer
