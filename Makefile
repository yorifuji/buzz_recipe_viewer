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