set -e

export PATH=/go/bin:${PATH}

mkdir -p /usr/local/linux

/scripts/toolchains/linux/install-openssl.sh
/scripts/toolchains/linux/install-libssh2.sh

# Set temp environment vars
export LIBGIT2_BUILD_PATH=/deps/libgit2
export LIBGIT2_OUTPUT_PREFIX=/usr/local/linux

# Env used during libgit2 install
export OPENSSL_OUTPUT_PREFIX=/usr/local/linux
export OPENSSL_SSL_LIBRARY="${OPENSSL_OUTPUT_PREFIX}/lib"
export OPENSSL_CRYPTO_LIBRARY="${OPENSSL_OUTPUT_PREFIX}/lib"
export LIBSSH2_OUTPUT_PREFIX=/usr/local/linux
export LIBSSH2_FOUND=true
export LIBSSH2_INCLUDE_DIRS="${LIBSSH2_OUTPUT_PREFIX}/include"
export LIBSSH2_LIBRARY_DIRS="${LIBSSH2_OUTPUT_PREFIX}/lib64"

mkdir -p ${LIBGIT2_BUILD_PATH}/build/linux
mkdir -p ${LIBGIT2_OUTPUT_PREFIX}

cd ${LIBGIT2_BUILD_PATH}/build/linux
cmake -DTHREADSAFE=ON \
      -DBUILD_CLAR=OFF \
      -DBUILD_SHARED_LIBS=OFF \
      -DCMAKE_C_FLAGS=-fPIC \
      -DCMAKE_BUILD_TYPE="RelWithDebInfo" \
      -DCMAKE_INSTALL_PREFIX=${LIBGIT2_OUTPUT_PREFIX} \
      ../..
cmake --build . --target install