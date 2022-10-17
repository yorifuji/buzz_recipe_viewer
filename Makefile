
.PHONY: analyze build

analyze:
	flutter analyze

build:
	flutter pub get && flutter pub run build_runner build --delete-conflicting-outputs


