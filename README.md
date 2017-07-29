# MacOS static binaries
- /usr/local/osx-ndk-x86/macports/pkgs/opt/local/lib

# Windows static binaries
- /usr/local/windows

# Linux static libraries
- /usr/local/linux


docker build --tag libgit2-xgo . && docker run -it --rm libgit2-xgo /bin/bash