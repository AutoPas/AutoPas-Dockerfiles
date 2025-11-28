FROM autopas/build-base

ENV GCCVERSION="13"

# install stuff
# add ppa for newer gcc, install gcc-13, and set links to make it default
RUN true \
    && apt-get -qq update \
    && apt-get -qq install -y --no-install-recommends \
        libopenmpi-dev \
        software-properties-common \
        python3-dev \
    && add-apt-repository -y ppa:ubuntu-toolchain-r/test \
    && apt-get -qq update \
    && apt-get -qq install -y --no-install-recommends \
        g++-${GCCVERSION} \
    && rm -rf /var/lib/apt/lists/* \
    && ln -s -f /usr/bin/gcc-${GCCVERSION} /usr/bin/gcc \
    && ln -s -f /usr/bin/g++-${GCCVERSION} /usr/bin/g++

# install lcov and set gcov-13
RUN cd \
    && perl -MCPAN -e 'install(Capture::Tiny, DateTime, Date::Parse, Cpanel::JSON::XS)' \
    && git clone https://github.com/linux-test-project/lcov.git \
    && cd lcov \
    && make install \
    && update-alternatives --install /usr/bin/gcov gcov /usr/bin/gcov-13 60 \
    && cd

CMD ["sh", "-c", "cmake -GNinja ../.. && ninja && ninja test"]
