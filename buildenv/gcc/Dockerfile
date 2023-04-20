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
    && add-apt-repository -y ppa:ubuntu-toolchain-r/test \
    && apt-get -qq update \
    && apt-get -qq install -y --no-install-recommends \
        g++-${GCCVERSION} \
    && rm -rf /var/lib/apt/lists/* \
    && ln -s -f /usr/bin/gcc-${GCCVERSION} /usr/bin/gcc \
    && ln -s -f /usr/bin/g++-${GCCVERSION} /usr/bin/g++

CMD ["sh", "-c", "cmake -GNinja ../.. && ninja && ninja test"]
