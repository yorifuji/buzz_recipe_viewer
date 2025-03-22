.PHONY: prepare-env
prepare-env:
	test -e .env || cp .env_example .env

.PHONY: build-runner
build-runner:
	test -e .env || cp .env_example .env
	fvm flutter pub get && fvm dart run build_runner build -d && fvm dart format -l 80 lib/i18n

.PHONY: build-launcher-icons
build-launcher-icons:
	fvm flutter pub run flutter_launcher_icons:main

.PHONY: update-goldens
update-goldens:
	fvm flutter test --update-goldens --tags=golden

# Firebase

.PHONY: flutterfire-configure-dev
flutterfire-configure-dev:
	flutterfire configure \
		--overwrite-firebase-options \
		--project=buzzrecipeviewer-dev \
		--platforms=android,ios,macos,web \
		--android-package-name=dev.yorifuji.buzz_recipe_viewer.dev \
		--ios-bundle-id=dev.yorifuji.buzzRecipeViewer.dev \
		--macos-bundle-id=dev.yorifuji.buzzRecipeViewer

.PHONY: flutterfire-configure-stg
flutterfire-configure-stg:
	flutterfire configure \
		--overwrite-firebase-options \
		--project=buzzrecipeviewer-stg \
		--platforms=android,ios,macos,web \
		--android-package-name=dev.yorifuji.buzz_recipe_viewer.stg \
		--ios-bundle-id=dev.yorifuji.buzzRecipeViewer.stg \
		--macos-bundle-id=dev.yorifuji.buzzRecipeViewer

.PHONY: flutterfire-configure-prod
flutterfire-configure-prod:
	flutterfire configure \
		--overwrite-firebase-options \
		--project=buzzrecipeviewer \
		--platforms=android,ios,macos,web \
		--android-package-name=dev.yorifuji.buzz_recipe_viewer \
		--ios-bundle-id=dev.yorifuji.buzzRecipeViewer \
		--macos-bundle-id=dev.yorifuji.buzzRecipeViewer

.PHONY: firebase-deploy-dev
firebase-deploy-dev:
	firebase deploy --config firebase/firebase.json --project buzzrecipeviewer-dev --only firestore:rules,storage

.PHONY: firebase-deploy-stg
firebase-deploy-stg:
	firebase deploy --config firebase/firebase.json --project buzzrecipeviewer-stg --only firestore:rules,storage

.PHONY: firebase-deploy-prod
firebase-deploy-prod:
	firebase deploy --config firebase/firebase.json --project buzzrecipeviewer --only firestore:rules,storage

ghalint:
	ghalint -c .ghalint run
