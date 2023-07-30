
.PHONY: analyze build 

analyze:
	flutter analyze

build-runner:
	flutter pub get && dart run build_runner build -d

build-launcher-icons:
	flutter pub run flutter_launcher_icons:main
