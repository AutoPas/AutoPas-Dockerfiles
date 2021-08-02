FROM autopas/build-base

# install base requirements
RUN true \
    && apt-get -qq update \
    && apt-get -qq install -y --no-install-recommends \
        lcov \
        gcovr \
    && rm -rf /var/lib/apt/lists/*

# create a link so that python can be found 
RUN ln -s /usr/bin/python3 /usr/bin/python

ENTRYPOINT []

CMD ["sh", "-c", "cmake -GNinja -DAUTOPAS_CODE_COVERAGE=ON -DCMAKE_BUILD_TYPE=Debug ../.. && ninja AutoPas_cobertura"]
