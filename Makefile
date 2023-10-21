
.PHONY: build-runner build-launcher-icons update-goldens

build-runner:
	test -e .env || cp .env_example .env
	flutter pub get && dart run build_runner build -d && dart format -l 80 lib/i18n

build-launcher-icons:
	flutter pub run flutter_launcher_icons:main

update-goldens:
	flutter test --update-goldens --tags=golden