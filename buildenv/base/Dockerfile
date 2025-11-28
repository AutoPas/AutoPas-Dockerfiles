FROM ubuntu:24.04

ENV UBUNTUVERSION="noble" \
    DEBIAN_FRONTEND="noninteractive"

# install base requirements + stuff that makes debugging easier
RUN true \
    && apt-get -qq update \
    && apt-get -qq install -y --no-install-recommends \
        build-essential \
        ca-certificates \
        ccache \
        cmake \
        gdb \
        git \
        gnupg \
        ninja-build \
        libsqlite3-dev \
        ssh \
        vim \
        wget \
        python3-dev \
# install AutoPas dependencies so we don't rely on bundled versions
        libeigen3-dev \
        libyaml-cpp-dev \
        libspdlog-dev \
# needed for bundled antlr4 (rule based tuning parser engine)
        uuid-dev \
    && rm -rf /var/lib/apt/lists/*

# If we need a newer version of cmake 
# RUN wget \
#         --no-verbose \
#         -O cmakeInstallScript.sh \
#         https://github.com/Kitware/CMake/releases/download/v3.21.0-rc3/cmake-3.21.0-rc3-linux-x86_64.sh \
#             --no-check-certificate \
#     && bash cmakeInstallScript.sh \
#             --skip-license \
#             --prefix=/usr \
#     && rm cmakeInstallScript.sh

COPY bin/entrypoint.sh /usr/local/bin
RUN ln -s /usr/local/bin/entrypoint.sh / # backwards compat
RUN mkdir -p /ccache_default_dir
RUN chmod 777 /ccache_default_dir

ENTRYPOINT ["entrypoint.sh"]
