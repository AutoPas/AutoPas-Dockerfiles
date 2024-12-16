FROM autopas/build-base

ENV GCCVERSION="11"

# install stuff
# openmpi 4.0.3 still has a memory leak, hence install mpich
# add ppa for newer gcc, install gcc-11, and set links to make it default
RUN true \
    && apt-get -qq update \
    && apt-get -qq install -y --no-install-recommends \
        libmpich-dev \
        software-properties-common \
        python3.8 python3.8-dev python3.8-distutils python3.8-venv python3-pip \
        pybind11-dev \
        nlohmann-json3-dev \
    && add-apt-repository -y ppa:ubuntu-toolchain-r/test \
    && apt-get -qq update \
    && apt-get -qq install -y --no-install-recommends \
        g++-${GCCVERSION} \
    && rm -rf /var/lib/apt/lists/* \
    && ln -s -f /usr/bin/gcc-${GCCVERSION} /usr/bin/gcc \
    && ln -s -f /usr/bin/g++-${GCCVERSION} /usr/bin/g++ \
    && ln -sf /usr/bin/python3.8 /usr/bin/python3

# Upgrade Python pip, setuptools, and wheel
RUN python3 -m pip install --no-cache-dir --upgrade pip setuptools wheel \
    && python3 -m pip install --no-cache-dir numpy pandas

# Install lcov and set gcov-11
RUN cd \
    && perl -MCPAN -e 'install(Capture::Tiny, DateTime, Date::Parse, Cpanel::JSON::XS)' \
    && git clone https://github.com/linux-test-project/lcov.git \
    && cd lcov \
    && make install \
    && update-alternatives --install /usr/bin/gcov gcov /usr/bin/gcov-11 60 \
    && cd

CMD ["sh", "-c", "cmake -GNinja ../.. && ninja && ninja test"]
