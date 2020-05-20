FROM ubuntu:18.04

# install base requirements
RUN true \
	&& apt-get -qq update \
	&& apt-get -qq install -y --no-install-recommends \
		build-essential \
		ninja-build \
		wget \
		gdb \
		git \
		ccache \
		ssh \
		gnupg \
		ca-certificates \
# install AutoPas dependencies so we don't rely on bundled versions
        libeigen3-dev \
        libyaml-cpp-dev \
        # libspdlog-dev \ <- version too old. Needs at least 1.3.1
    && rm -rf /var/lib/apt/lists/*

# we might want to fix the certificate stuff
RUN wget -O cmakeInstallScript.sh https://github.com/Kitware/CMake/releases/download/v3.14.5/cmake-3.14.5-Linux-x86_64.sh --no-check-certificate \
    && chmod +x cmakeInstallScript.sh \
    && ./cmakeInstallScript.sh --skip-license \
    && rm cmakeInstallScript.sh

# if we ever need to switch to manual install
# RUN apt-get -qq install -y cmake \
    # && wget https://github.com/Kitware/CMake/releases/download/v3.15.0-rc3/cmake-3.15.0-rc3.tar.gz \
    # && tar -xzf cmake-3.15.0-rc3.tar.gz \
    # && cd $_ \
    # && mkdir build \
    # && cd build \
    # && cmake .. \
    # && make -j4 \
    # && make install

# install spdlog from source bc repo version is too old
RUN wget -O spdlog.tgz https://github.com/gabime/spdlog/archive/v1.4.2.tar.gz --no-check-certificate \
    && tar -xzf spdlog.tgz \
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
