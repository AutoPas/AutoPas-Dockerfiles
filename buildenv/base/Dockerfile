FROM ubuntu:20.04

ENV UBUNTUVERSION="focal" \
    DEBIAN_FRONTEND="noninteractive"

# install base requirements
RUN true \
    && apt-get -qq update \
    && apt-get -qq install -y --no-install-recommends \
        build-essential \
        ca-certificates \
        ccache \
        gdb \
        git \
        gnupg \
        ninja-build \
        ssh \
        wget \
# install AutoPas dependencies so we don't rely on bundled versions
        libeigen3-dev \
        libyaml-cpp-dev \
        # libspdlog-dev \ <- version too old. Needs at least 1.3.1
    && rm -rf /var/lib/apt/lists/*

# we might want to fix the certificate stuff
RUN wget \
        --no-verbose \
        -O cmakeInstallScript.sh \
        https://github.com/Kitware/CMake/releases/download/v3.21.0-rc3/cmake-3.21.0-rc3-linux-x86_64.sh \
            --no-check-certificate \
    && bash cmakeInstallScript.sh \
            --skip-license \
            --prefix=/usr \
    && rm cmakeInstallScript.sh

# if we ever need to switch to manual install
# RUN apt-get -qq install -y cmake \
    # && wget --no-verbose https://github.com/Kitware/CMake/releases/download/v3.15.0-rc3/cmake-3.15.0-rc3.tar.gz \
    # && tar -xzf cmake-3.15.0-rc3.tar.gz \
    # && cd $_ \
    # && mkdir build \
    # && cd build \
    # && cmake .. \
    # && make -j4 \
    # && make install

# install spdlog from source bc repo version is too old
RUN wget --no-verbose -O spdlog.tgz https://github.com/gabime/spdlog/archive/v1.4.2.tar.gz --no-check-certificate \
    && tar -xzf spdlog.tgz \
    && rm spdlog.tgz \
    && cd spdlog-* \
    && mkdir build \
    && cd build \
    && cmake .. \
        -DCMAKE_BUILD_TYPE=RELEASE \
        -DSPDLOG_BUILD_EXAMPLE=OFF \
        -DSPDLOG_BUILD_TESTS=OFF \
    && make install -j4

COPY bin/entrypoint.sh /usr/local/bin
RUN ln -s /usr/local/bin/entrypoint.sh / # backwards compat
RUN mkdir -p /ccache_default_dir
RUN chmod 777 /ccache_default_dir

ENTRYPOINT ["entrypoint.sh"]
