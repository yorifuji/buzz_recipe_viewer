#!/bin/zsh

# Fail this script if any subcommand fails.
set -e

# The default execution directory of this script is the ci_scripts directory.
cd $CI_PRIMARY_REPOSITORY_PATH # change working directory to the root of your cloned repo.

# Install jq if not available
which jq || HOMEBREW_NO_AUTO_UPDATE=1 brew install jq

WHAT_TO_TEST=""

if [ -n "$CI_PULL_REQUEST_NUMBER" ] && [ -n "$GITHUB_TOKEN" ]; then
  # Check if CI_PULL_REQUEST_TARGET_REPO is set
  if [ -z "$CI_PULL_REQUEST_TARGET_REPO" ]; then
    echo "Error: CI_PULL_REQUEST_TARGET_REPO is not set, cannot fetch PR information"
  else
    echo "Fetching PR information for TestFlight..."
    PR_INFO=$(curl -s -w "%{http_code}" \
      -H "Accept: application/vnd.github+json" \
      -H "Authorization: Bearer $GITHUB_TOKEN" \
      -H "X-GitHub-Api-Version: 2022-11-28" \
      "https://api.github.com/repos/$CI_PULL_REQUEST_TARGET_REPO/pulls/$CI_PULL_REQUEST_NUMBER")
    
    HTTP_STATUS=${PR_INFO: -3}
    PR_INFO_BODY=${PR_INFO:0:${#PR_INFO}-3}
    
    if [[ "$HTTP_STATUS" -ge 200 ]] && [[ "$HTTP_STATUS" -lt 300 ]]; then
      echo "Successfully fetched PR information (HTTP Status: $HTTP_STATUS)"
      PR_TITLE=$(printf '%s\n' "$PR_INFO_BODY" | jq -r '.title')
      
      if [ $? -ne 0 ] || [ "$PR_TITLE" = "null" ]; then
        echo "Warning: Failed to extract PR title from API response"
        PR_TITLE="Unknown PR Title"
      fi
      
      WHAT_TO_TEST="[PR#$CI_PULL_REQUEST_NUMBER]\n$PR_TITLE\n"
    else
      echo "Failed to fetch PR information (HTTP Status: $HTTP_STATUS)"
      echo "Response: $PR_INFO_BODY"
      WHAT_TO_TEST="[PR#$CI_PULL_REQUEST_NUMBER]\nNo PR title available\n"
    fi
  fi
else
  # Log why we're not adding a comment
  if [ -z "$CI_PULL_REQUEST_NUMBER" ]; then
    echo "Skipping PR information: This is not a pull request build (CI_PULL_REQUEST_NUMBER is not set)"
  elif [ -z "$GITHUB_TOKEN" ]; then
    echo "Skipping PR information: GITHUB_TOKEN is not set"
  else
    echo "Skipping PR information: Unknown reason"
  fi
fi

COMMIT=$(git fetch --deepen 3 && git log -3 --pretty=format:"%s")

WHAT_TO_TEST=${WHAT_TO_TEST}"[COMMIT]\n$COMMIT"

if [[ -d "$CI_APP_STORE_SIGNED_APP_PATH" ]]; then
  # TestFlight directory should be in the same folder as the Xcode project or workspace
  # See: https://developer.apple.com/documentation/Xcode/including-notes-for-testers-with-a-beta-release-of-your-app
  # Create TestFlight directory in the iOS project directory
  TESTFLIGHT_DIR_PATH="$CI_PRIMARY_REPOSITORY_PATH/ios/TestFlight"
  mkdir -p $TESTFLIGHT_DIR_PATH
  
  # Create notes for English (US) users
  echo "$WHAT_TO_TEST" > $TESTFLIGHT_DIR_PATH/WhatToTest.en-US.txt
  
  # Create notes for Japanese users (same content)
  echo "$WHAT_TO_TEST" > $TESTFLIGHT_DIR_PATH/WhatToTest.ja-JP.txt
  
  echo "TestFlight What to Test information prepared at $TESTFLIGHT_DIR_PATH for en-US and ja-JP locales"
  echo "Content of What to Test:"
  echo "$WHAT_TO_TEST"
else
  echo "Skipping TestFlight What to Test preparation as CI_APP_STORE_SIGNED_APP_PATH is not available"
  echo "CI_APP_STORE_SIGNED_APP_PATH: ${CI_APP_STORE_SIGNED_APP_PATH:-'not set'}"
fi 