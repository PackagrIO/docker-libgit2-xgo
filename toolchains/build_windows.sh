set -e

if [ ! -f /usr/local/bin/windres ]; then
  ln -s /usr/bin/x86_64-w64-mingw32-windres /usr/local/bin/windres
fi

cd /deps/openssl
CC=x86_64-w64-mingw32-gcc HOST=x86_64-w64-mingw32 INCLUDE=/usr/x86_64-w64-mingw32/include LIB=/usr/x86_64-w64-mingw32/lib ./Configure --prefix=/usr/x86_64-w64-mingw32 mingw64
make
make install

cd /deps/libgit2
mkdir -p build/windows
cd build/windows

# Need this fix http://www.cmake.org/gitweb?p=cmake.git;a=commitdiff;h=c5d9a8283cfac15b4a5a07f18d5eb10c1f388505

#sed -i 's/REGEX "^#define[\t ]+OPENSSL_VERSION_NUMBER[\t ]+0x([0-9a-fA-F])+.*")/REGEX "^# *define[\t ]+OPENSSL_VERSION_NUMBER[\t ]+0x([0-9a-fA-F])+.*")/g'

sed -i 's/REGEX "^#define\[\\t ]+OPENSSL_VERSION_NUMBER\[\\t ]+0x(\[0-9a-fA-F])+\.\*")/REGEX "^# *define[\\t ]+OPENSSL_VERSION_NUMBER[\\t ]+0x([0-9a-fA-F])+.*")/' /usr/share/cmake-3.5/Modules/FindOpenSSL.cmake

VERBOSE=1 cmake ../.. -DBUILD_SHARED_LIBS=OFF -DCMAKE_BUILD_TYPE=Release -DBUILD_CLAR=OFF -DTHREADSAFE=ON \
            -DCMAKE_TOOLCHAIN_FILE=/scripts/toolchains/windows/windows.cmake -DCMAKE_INSTALL_PREFIX=/usr/local/windows \
            -DCMAKE_VERBOSE_MAKEFILE=ON
cmake --build . --target install

FLAGS=$(x86_64-w64-mingw32-pkg-config --static --libs /usr/local/windows/lib/pkgconfig/libgit2.pc)
export CGO_CFLAGS="-I/usr/local/windows/include -I/usr/x86_64-w64-mingw32/include"
export CGO_LDFLAGS="/usr/local/windows/lib/libgit2.a -L/usr/local/windows/lib -L/usr/x86_64-w64-mingw32/lib ${FLAGS}"
export PKG_CONFIG_PATH=/usr/local/windows/lib/pkgconfig:/usr/x86_64-w64-mingw32/lib/pkgconfig
