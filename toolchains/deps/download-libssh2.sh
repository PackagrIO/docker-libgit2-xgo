# Set temp environment vars
export REPO=https://github.com/libssh2/libssh2
export BRANCH=libssh2-1.7.0
export LIBSSH2_BUILD_PATH=/deps/libssh2

# download libssh2
git clone -b ${BRANCH} --depth 1 -- ${REPO} ${LIBSSH2_BUILD_PATH}