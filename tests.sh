#!/bin/bash

# Run macOS tests
set -o pipefail && xcodebuild test -workspace DRRxObservableArray.xcworkspace -scheme 'DRRxObservableArrayTests-macOS' | xcpretty

# Run iOS tests
set -o pipefail && xcodebuild test -workspace DRRxObservableArray.xcworkspace -scheme 'DRRxObservableArrayTests-iOS' -destination 'platform=iOS Simulator,name=iPhone 7,OS=latest' ONLY_ACTIVE_ARCH=NO | xcpretty
