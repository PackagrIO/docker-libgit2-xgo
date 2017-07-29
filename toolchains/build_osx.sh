#!/usr/bin/env bash
set -e

export MACOSX_DEPLOYMENT_TARGET=10.11
export PATH=/usr/local/osx-ndk-x86/tools:/go/bin:${PATH}
export OSXCROSS_MACPORTS_MIRROR=http://packages.macports.org

# CMake will blow up if there's no /Applications folder
mkdir -p /Applications

# Need libssh2 for OS X
osxcross-macports install -s libssh2 libgcrypt openssl

cd /deps/libgit2
mkdir -p build/osx
cd build/osx
set +e
OSXCROSS_MP_INC=1 VERBOSE=1 cmake ../.. -DBUILD_SHARED_LIBS=OFF -DCMAKE_BUILD_TYPE=Release -DBUILD_CLAR=OFF -DTHREADSAFE=ON \
            -DCMAKE_TOOLCHAIN_FILE=/scripts/toolchains/osx/osx.cmake -DCMAKE_INSTALL_PREFIX=/usr/local/osx-ndk-x86/macports/pkgs/opt/local \
            -DCMAKE_VERBOSE_MAKEFILE=ON
set -e
# For some reason cmake finds v 0.0 of libssl the first time and errors out, works second time
OSXCROSS_MP_INC=1 VERBOSE=1 cmake ../.. -DBUILD_SHARED_LIBS=OFF -DCMAKE_BUILD_TYPE=Release -DBUILD_CLAR=OFF -DTHREADSAFE=ON \
            -DCMAKE_TOOLCHAIN_FILE=/scripts/toolchains/osx/osx.cmake -DCMAKE_INSTALL_PREFIX=/usr/local/osx-ndk-x86/macports/pkgs/opt/local \
            -DCMAKE_VERBOSE_MAKEFILE=ON
OSXCROSS_MP_INC=1 cmake --build . --target install


# Switch to Go1.4 or OS X because of issues combining dwarfs (did I just write that?!)
# See: https://groups.google.com/forum/#!msg/golang-codereviews/ZBP6jU-v0aQ/q0DYDWHndb0J
#export PATH=/usr/local/osx-ndk-x86/bin/:/usr/local/go/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
#
## BUILD INSTALL FOR CAPSULECD SPECIFIC, REMOVE ONLY
#go get github.com/Masterminds/glide
#
#cd /go/src
#git clone https://github.com/AnalogJ/capsulecd.git
#cd capsulecd
#CC=o64-clang GOOS=darwin GOARCH=amd64 CGO_ENABLED=1 glide install \
#	&& mkdir -p /go/src/capsulecd/vendor/gopkg.in/libgit2/git2go.v25/vendor/libgit2/build \
#	&& cp -r /usr/local/osx-ndk-x86/macports/pkgs/opt/local/lib/pkgconfig/. /go/src/capsulecd/vendor/gopkg.in/libgit2/git2go.v25/vendor/libgit2/build/
#
#OSXCROSS_MP_INC=1  CC=o64-clang GOOS=darwin GOARCH=amd64 CGO_ENABLED=1 go build -v -a -tags 'static' ./cmd/capsulecd/capsulecd.go
