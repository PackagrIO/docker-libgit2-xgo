# Go cross compiler (xgo): Wildcard layer to the latest Go release
# Copyright (c) 2014 Péter Szilágyi. All rights reserved.
#
# Released under the MIT license.

FROM karalabe/xgo-1.13.4 as base

MAINTAINER Jason Kulatunga <jason@thesparktree.com>

WORKDIR /scripts


RUN apt-get update && apt-get install -y --no-install-recommends \
	cmake \
	clang-3.6 \
	mingw-w64-tools \
	&& rm -rf /var/lib/apt/lists/* \
	&& mkdir -p /usr/local/osx-ndk-x86/tools

#RUN git clone https://go.googlesource.com/go /usr/local/go-1.5 && \
#    cd /usr/local/go-1.5/src && \
#    GOROOT_BOOTSTRAP=/usr/local/go ./make.bash

#ENV PATH /usr/local/go-1.5/bin:$PATH

COPY . /scripts/

COPY toolchains/osx/osxcross-macports /usr/local/osx-ndk-x86/tools

RUN /scripts/build.sh

ENTRYPOINT []


# strip away all build tooling, this image should just contain the compiled libraries
FROM debian:stretch-slim

# zlib is required for libgit2 to compile statically
RUN apt-get update && apt-get install -y --no-install-recommends \
    zlib1g-dev \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /usr/share/doc && rm -rf /usr/share/man \
    && apt-get clean \
    && mkdir -p /usr/local/

COPY --from=base /scripts/ /scripts/
COPY --from=base /usr/local/linux/ /usr/local/linux/
COPY --from=base /usr/local/osx-ndk-x86/ /usr/local/osx-ndk-x86/
#COPY --from=base /usr/local/windows/ /usr/local/windows/
