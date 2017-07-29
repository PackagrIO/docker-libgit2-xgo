export MACOSX_DEPLOYMENT_TARGET=10.11
export PATH=/usr/local/osx-ndk-x86/tools:/go/bin:${PATH}
export OSXCROSS_MACPORTS_MIRROR=http://packages.macports.org


# For some reason the osxcross pkg-config messes up the directories. Ideally we would just use the following line:
# FLAGS=$(/usr/local/osx-ndk-x86/bin/x86_64-apple-darwin15-pkg-config --static --libs /usr/local/osx-ndk-x86/macports/pkgs/opt/local/lib/pkgconfig/libgit2.pc)
# But instead we manually fix the output
#FLAGS="-Wl,-headerpad_max_install_names -arch x86_64 -L/usr/local/osx-ndk-x86/macports/pkgs/opt/local/lib -L/usr/local/osx-ndk-x86/macports/pkgs/opt/local/lib -liconv -lgit2 -lssh2 -lssl -lcrypto -lz"
FLAGS="-L/usr/local/osx-ndk-x86/macports/pkgs/opt/local/lib -L/usr/local/osx-ndk-x86/macports/pkgs/opt/local/lib -L/usr/local/osx-ndk-x86/macports/pkgs/opt/local/lib -lgit2 -framework Security -framework CoreFoundation -lssl -lcrypto -lz -lssh2 -liconv"

export CGO_CFLAGS="-I/usr/local/osx-ndk-x86/macports/pkgs/opt/local/include"
export CGO_LDFLAGS="/usr/local/osx-ndk-x86/macports/pkgs/opt/local/lib/libgit2.a -L/usr/local/osx-ndk-x86/macports/pkgs/opt/local/lib ${FLAGS}"
export PKG_CONFIG_PATH=/usr/local/osx-ndk-x86/macports/pkgs/opt/local/lib/pkgconfig