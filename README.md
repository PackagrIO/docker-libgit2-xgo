![Docker Automated build](https://img.shields.io/docker/automated/analogj/libgit2-xgo?style=flat-square)
![Docker Pulls](https://img.shields.io/docker/pulls/analogj/libgit2-xgo?style=flat-square)
![GitHub](https://img.shields.io/github/license/analogj/docker-libgit2-xgo?style=flat-square)

# MacOS static binaries
- /usr/local/osx-ndk-x86/macports/pkgs/opt/local/lib

# Windows static binaries
- /usr/local/windows

# Linux static libraries
- /usr/local/linux


docker build --tag libgit2-xgo . && docker run -it --rm libgit2-xgo /bin/bash
