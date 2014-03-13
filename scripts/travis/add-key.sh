#!/bin/sh
echo "*********************"
echo "*    DECRYPT KEY    *"
echo "*********************"

openssl aes-256-cbc -k "$ENCRYPTION_SECRET" -in scripts/travis/profile/$PROFILE_NAME.mobileprovision.enc -d -a -out scripts/travis/profile/$PROFILE_NAME.mobileprovision
openssl aes-256-cbc -k "$ENCRYPTION_SECRET" -in scripts/travis/certs/apple.cer.enc -d -a -out scripts/travis/certs/apple.cer
openssl aes-256-cbc -k "$ENCRYPTION_SECRET" -in scripts/travis/certs/dist.cer.enc -d -a -out scripts/travis/certs/dist.cer
openssl aes-256-cbc -k "$ENCRYPTION_SECRET" -in scripts/travis/certs/dist.p12.enc -d -a -out scripts/travis/certs/dist.p12


echo "*********************"
echo "*      ADD KEY      *"
echo "*********************"
security create-keychain -p travis ios-build.keychain
security import ./scripts/travis/certs/apple.cer -k ~/Library/Keychains/ios-build.keychain -T /usr/bin/codesign -A
security import ./scripts/travis/certs/dist.cer -k ~/Library/Keychains/ios-build.keychain -T /usr/bin/codesign -A
security import ./scripts/travis/certs/dist.p12 -k ~/Library/Keychains/ios-build.keychain -P $KEY_PASSWORD -T /usr/bin/codesign -A
security list-keychains -d user -s ios-build.keychain
security list-keychains


echo "*********************"
echo "*   IMPORT PROFILE  *"
echo "*********************"
mkdir -p ~/Library/MobileDevice/Provisioning\ Profiles
cp ./scripts/travis/profile/$PROFILE_NAME.mobileprovision ~/Library/MobileDevice/Provisioning\ Profiles/
ls ~/Library/MobileDevice/Provisioning\ Profiles/


