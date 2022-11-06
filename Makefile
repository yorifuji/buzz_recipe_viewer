
.PHONY: analyze \
	build \
	create-env-file \
	create-keystore-file \
	create-service-account-file \
	create-key-properties-file

analyze:
	flutter analyze

build:
	flutter pub get && flutter pub run build_runner build --delete-conflicting-outputs

create-env-file:
	echo "ALGOLIA_APPLICATION_ID=$${ALGOLIA_APPLICATION_ID}" > .env
	echo "ALGOLIA_API_KEY=$${ALGOLIA_API_KEY}" >> .env
