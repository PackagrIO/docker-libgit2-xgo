#!/bin/sh
set -x
set -e

# Set temp environment vars
export OPENSSL_BUILD_PATH=/deps/openssl
export OPENSSL_OUTPUT_PREFIX=/usr/local/linux

mkdir -p ${OPENSSL_OUTPUT_PREFIX}/lib
cd ${OPENSSL_BUILD_PATH}
./config threads no-shared --prefix=${OPENSSL_OUTPUT_PREFIX} -fPIC -DOPENSSL_PIC &&
make depend &&
make &&
make install

# Cleanup
# rm -r ${LIBGIT2PATH}
