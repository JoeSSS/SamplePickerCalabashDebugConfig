#!/usr/bin/env bash

# If you see an error like this:
#
# iPhone Developer: ambiguous (matches "iPhone Developer: Person A (2<snip>Q)"
#                                  and "iPhone Developer: Person B (8<snip>F)"
# in /Users/<snip>/Library/Keychains/login.keychain)
#
# do the following.
#
# If you are building from Xcode, select the correct Code Signing Identity in
# Xcode > Project > Target > Build Settings > Code Signing Identity
#
# If you are build from the command line:
# $ CODE_SIGN_IDENTITY="iPhone Developer: Person B (8<snip>F)" xcrun xcodebuild < args >

set -e

if [ "${CONFIGURATION}" = "Debug" ]; then
  cp "${SRCROOT}/libCalabashDynFAT.dylib" "${BUILT_PRODUCTS_DIR}/${FULL_PRODUCT_NAME}/libCalabashDynFAT.dylib"
  if [ -n "${CODE_SIGN_IDENTITY}" ]; then
    xcrun codesign -fs "${CODE_SIGN_IDENTITY}" "${BUILT_PRODUCTS_DIR}/${FULL_PRODUCT_NAME}/libCalabashDynFAT.dylib"
  fi
fi

