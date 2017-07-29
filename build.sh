#!/bin/bash

set -e

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

# download source for dependencies
/scripts/toolchains/deps/download-openssl.sh
/scripts/toolchains/deps/download-libssh2.sh
/scripts/toolchains/deps/download-libgit2.sh

echo "Building Linux libraries"
$DIR/toolchains/build_linux.sh
echo "Building OSX libraries"
$DIR/toolchains/build_osx.sh
#echo "Building Windows libraries"
#$DIR/toolchains/build_windows.sh
