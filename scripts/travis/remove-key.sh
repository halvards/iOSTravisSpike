#!/bin/sh
echo "** REMOVE KEYCHAIN **"
security delete-keychain ios-build.keychain
rm -f ~/Library/MobileDevice/Provisioning\ Profiles/$PROFILE_NAME.mobileprovision