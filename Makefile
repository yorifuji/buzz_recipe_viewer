
.PHONY: analyze build 

analyze:
	flutter analyze

build-runner:
	flutter pub get && flutter pub run build_runner build --delete-conflicting-outputs

build-launcher-icons:
	flutter pub run flutter_launcher_icons:main
