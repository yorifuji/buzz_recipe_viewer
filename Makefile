
.PHONY: analyze build

analyze:
	flutter analyze

build:
	flutter pub get && flutter pub run build_runner build --delete-conflicting-outputs

create-env-file:
	echo "ALGOLIA_APPLICATION_ID=$${ALGOLIA_APPLICATION_ID}" > .env
	echo "ALGOLIA_API_KEY=$${ALGOLIA_API_KEY}" >> .env

create-keystore-file:
	echo $${ANDROID_KEY_JKS_BASE64} | base64 --decode > android/app/upload.jks

create-service-account-file:
	echo $${GOOGLE_SERVICE_ACCOUNT_KEY_JSON_BASE64} | base64 --decode > android/service-account-ke.json

create-key-properties-file:
	echo "storeFile=./upload.jks" > android/key.properties
	echo "storePassword=$${ANDROID_STORE_PASSWORD}" >> android/key.properties
	echo "keyPassword=$${ANDROID_KEY_PASSWORD}" >> android/key.properties
	echo "keyAlias=$${ANDROID_KEY_ALIAS}" >> android/key.properties
	echo "serviceAccountFile=service-account-ke.json" >> android/key.properties
