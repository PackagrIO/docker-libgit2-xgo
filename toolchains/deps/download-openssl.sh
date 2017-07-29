# Set temp environment vars
export REPO=https://github.com/openssl/openssl.git
export BRANCH=OpenSSL_1_0_2-stable
export OPENSSL_BUILD_PATH=/deps/openssl

# Download openssl
git clone -b ${BRANCH} --depth 1 -- ${REPO} ${OPENSSL_BUILD_PATH}