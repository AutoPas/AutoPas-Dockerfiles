FROM autopas/build-base

# install graphviz
RUN true \
    && apt-get -qq update \
    && apt-get -qq install -y --no-install-recommends \
        ca-certificates \
        graphviz \
        python3 \
        flex \
        bison \
        python3-dev \
    && rm -rf /var/lib/apt/lists/*

RUN update-ca-certificates

# install doxygen from git to select a version that has a minimal number of bugs...
RUN git clone --branch master https://github.com/doxygen/doxygen.git \
    && cd doxygen \
    && git checkout 6daf5d3c36feed7f4dee31943cab1f4600bbce03 
RUN mkdir doxygen/myBuild \
    && cd doxygen/myBuild \
    && cmake -G Ninja -DCMAKE_BUILD_TYPE=Release .. \
    && ninja \
    && ninja install

COPY bin/buildDocumentation.sh /usr/local/bin

# by default build the documentation.
ENTRYPOINT ["buildDocumentation.sh"]
