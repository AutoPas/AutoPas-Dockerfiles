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

COPY bin/entrypoint.sh /usr/local/bin
RUN ln -s /usr/local/bin/entrypoint.sh / # backwards compat
RUN mkdir -p /ccache_default_dir
RUN chmod 777 /ccache_default_dir

ENTRYPOINT ["entrypoint.sh"]
