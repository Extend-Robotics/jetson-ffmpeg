#! /bin/bash

# ------------------------------------ #
# This script generates debian package #
#
# By default result will be in
# - /tmp/packages
#
# The script
# - copies source to temporary location
# - builds debian package
# - copies result to $BINARIES_PATH
# -------------------------------------#

set -e

# Config

BUILD_PATH=/tmp/catkin_pkg
BINARIES_PATH=/tmp/packages

# Start from directory with this script
cd "$(dirname "$0")"
# Move to package directory
cd ..

# Get package name
PACKAGE_PATH=$(basename $(pwd))

# Move to directory containing package
cd ..

echo "debian packaging $PACKAGE_PATH"

### Copy source

mkdir -p "$BUILD_PATH"/src
cp -r "$PACKAGE_PATH" "$BUILD_PATH"/src/
cd "$BUILD_PATH"/src

cd "$PACKAGE_PATH"

### package
mkdir -p build
cd build
cmake -DCMAKE_BUILD_TYPE=Release ..
cpack -G DEB

# copy result

mkdir -p "$BINARIES_PATH"
cp ../_packages/*.deb "$BINARIES_PATH"

# Cleanup

rm -rf "$BUILD_PATH"

# Final message

echo "the resulting package was copied to"
echo "$BINARIES_PATH"

