FROM intel/oneapi-hpckit

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
        libspdlog-dev \
    && rm -rf /var/lib/apt/lists/*

# we might want to fix the certificate stuff
# RUN wget -O cmakeInstallScript.sh https://github.com/Kitware/CMake/releases/download/v3.14.5/cmake-3.14.5-Linux-x86_64.sh --no-check-certificate \
#     && chmod +x cmakeInstallScript.sh \
#     && ./cmakeInstallScript.sh --skip-license --prefix=/usr/local/ \
#     && rm cmakeInstallScript.sh

COPY bin/entrypoint.sh /usr/local/bin
RUN ln -s /usr/local/bin/entrypoint.sh / # backwards compat
RUN mkdir -p /ccache_default_dir
RUN chmod 777 /ccache_default_dir

ENTRYPOINT ["entrypoint.sh"]
