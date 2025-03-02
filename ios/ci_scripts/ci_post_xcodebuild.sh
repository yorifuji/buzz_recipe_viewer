#!/bin/zsh

# Fail this script if any subcommand fails.
set -e

# The default execution directory of this script is the ci_scripts directory.
cd $CI_PRIMARY_REPOSITORY_PATH # change working directory to the root of your cloned repo.

# Install jq if not available
which jq || HOMEBREW_NO_AUTO_UPDATE=1 brew install jq

WHAT_TO_TEST=""

if [ -n "$CI_PULL_REQUEST_NUMBER" ] && [ -n "$GITHUB_TOKEN" ]; then
  echo "Fetching PR information for TestFlight..."
  PR_INFO=$(curl -s \
    -H "Accept: application/vnd.github+json" \
    -H "Authorization: Bearer $GITHUB_TOKEN" \
    -H "X-GitHub-Api-Version: 2022-11-28" \
    "https://api.github.com/repos/$CI_PULL_REQUEST_TARGET_REPO/pulls/$CI_PULL_REQUEST_NUMBER")
  
  PR_TITLE=$(printf '%s\n' "$PR_INFO" | jq -r '.title')
  WHAT_TO_TEST="[PR#$CI_PULL_REQUEST_NUMBER]\n$PR_TITLE\n"
fi

COMMIT=$(git fetch --deepen 3 && git log -3 --pretty=format:"%s")

WHAT_TO_TEST=${WHAT_TO_TEST}"[COMMIT]\n$COMMIT"

if [[ -d "$CI_APP_STORE_SIGNED_APP_PATH" ]]; then
  TESTFLIGHT_DIR_PATH="$CI_PRIMARY_REPOSITORY_PATH/TestFlight"
  mkdir -p $TESTFLIGHT_DIR_PATH
  echo "$WHAT_TO_TEST" > $TESTFLIGHT_DIR_PATH/WhatToTest.en-US.txt
  echo "TestFlight What to Test information prepared at $TESTFLIGHT_DIR_PATH"
else
  echo "Skipping TestFlight What to Test preparation as CI_APP_STORE_SIGNED_APP_PATH is not available"
fi 