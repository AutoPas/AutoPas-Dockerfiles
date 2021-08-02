FROM autopas/build-base

# install stuff
# openmpi 4.0.3 still has a memory leak, hence install mpich
RUN true \
    && apt-get -qq update \
    && apt-get -qq install -y --no-install-recommends \
        libmpich-dev \
    && rm -rf /var/lib/apt/lists/*

CMD ["sh", "-c", "cmake -GNinja ../.. && ninja && ninja test"]
