# Set temp environment vars
export LIBGIT2REPO=https://github.com/libgit2/libgit2.git
export LIBGIT2BRANCH=v0.25.0
export LIBGIT2_BUILD_PATH=/deps/libgit2

# download libgit2
git clone -b ${LIBGIT2BRANCH} --depth 1 -- ${LIBGIT2REPO} ${LIBGIT2_BUILD_PATH}