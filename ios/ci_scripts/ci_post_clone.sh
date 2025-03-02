#!/bin/zsh

# Fail this script if any subcommand fails.
set -e

# Check required environment variables
[ -z "$DOT_ENV" ] && echo "Error: DOT_ENV is not set" && exit 1
[ -z "$FIREBASE_ADMIN_SERVICE_ACCOUNT_JSON_BASE64" ] && echo "Error: FIREBASE_ADMIN_SERVICE_ACCOUNT_JSON_BASE64 is not set" && exit 1

# The default execution directory of this script is the ci_scripts directory.
cd $CI_PRIMARY_REPOSITORY_PATH # change working directory to the root of your cloned repo.

# Install jq if not available
which jq || HOMEBREW_NO_AUTO_UPDATE=1 brew install jq

# Get Flutter version from .fvmrc
FLUTTER_VERSION=$(jq -r '.flutter' .fvmrc)
[ -z "$FLUTTER_VERSION" ] && echo "Error: Could not get Flutter version from .fvmrc" && exit 1
echo "Using Flutter version: $FLUTTER_VERSION from .fvmrc"

# Install Flutter using git.
git clone https://github.com/flutter/flutter.git -b $FLUTTER_VERSION $HOME/flutter
export PATH="$PATH:$HOME/flutter/bin"
export PATH="$PATH:$HOME/.pub-cache/bin"

# Install Flutter artifacts for iOS (--ios), or macOS (--macos) platforms.
flutter precache --ios

# Install firebase tools
which firebase || curl -sL https://firebase.tools | analytics=false bash
firebase --version

# Install flutterfire
which flutterfire || dart pub global activate flutterfire_cli
flutterfire -v

# Install xcodeproj for flutterfire configure
export GEM_HOME="$HOME/.gem"
export PATH="$PATH:$GEM_HOME/bin"
gem install xcodeproj

# Install CocoaPods using Homebrew.
HOMEBREW_NO_AUTO_UPDATE=1 brew install cocoapods

# Install Flutter dependencies.
flutter pub get

# Install CocoaPods dependencies.
(cd ios && pod install) # run `pod install` in the `ios` directory.

# .env
echo $DOT_ENV | base64 --decode > .env

# Run flutterfire configure
echo -n $FIREBASE_ADMIN_SERVICE_ACCOUNT_JSON_BASE64 | base64 --decode > firebase_admin_service_account.json
flutterfire configure \
   --overwrite-firebase-options \
   --project=buzzrecipeviewer \
   --platforms=ios \
   --ios-bundle-id=dev.yorifuji.buzzRecipeViewer \
   --service-account=firebase_admin_service_account.json

# Run flutter build for config only with flavor prod
flutter build ios --config-only --dart-define=FLAVOR=prod
