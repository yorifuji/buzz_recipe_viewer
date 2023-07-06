
.PHONY: analyze \
	build \
	create-env-file

analyze:
	flutter analyze

build:
	flutter pub get && flutter pub run build_runner build --delete-conflicting-outputs

build-icons:
	flutter pub run flutter_launcher_icons:main

create-env-file:
	echo "ALGOLIA_APPLICATION_ID=$${ALGOLIA_APPLICATION_ID}" > .env
	echo "ALGOLIA_SEARCH_ONLY_API_KEY=$${ALGOLIA_SEARCH_ONLY_API_KEY}" >> .env
