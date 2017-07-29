#!/bin/sh
set -x

# Set temp environment vars
export LIBSSH2_BUILD_PATH=/deps/libssh2
export LIBSSH2_OUTPUT_PREFIX=/usr/local/linux
export OPENSSL_OUTPUT_PREFIX=/usr/local/linux

export PKG_CONFIG_PATH="/usr/lib/pkgconfig/:/usr/local/linux/lib/pkgconfig/"
export PKG_CONFIG_PATH="${PKG_CONFIG_PATH}:${OPENSSL_OUTPUT_PREFIX}/lib/pkgconfig:${LIBSSH2_BUILD_PATH}/build/linux/src"

# Env used during libssh2 install
export OPENSSL_ROOT_DIR=${OPENSSL_OUTPUT_PREFIX}
export OPENSSL_LIBRARIES="${OPENSSL_OUTPUT_PREFIX}/lib"
export OPENSSL_INCLUDE_DIR="${OPENSSL_OUTPUT_PREFIX}/include"

mkdir -p ${LIBSSH2_BUILD_PATH}/build/linux
mkdir -p ${LIBSSH2_OUTPUT_PREFIX}
cd ${LIBSSH2_BUILD_PATH}/build/linux
cmake -DBUILD_SHARED_LIBS=OFF \
      -DCMAKE_C_FLAGS=-fPIC \
      -DCMAKE_BUILD_TYPE="RelWithDebInfo" \
      -DBUILD_EXAMPLES=OFF \
      -DBUILD_TESTING=OFF \
      -DCMAKE_INSTALL_PREFIX=${LIBSSH2_OUTPUT_PREFIX} \
      ../..
cmake --build . --target install

