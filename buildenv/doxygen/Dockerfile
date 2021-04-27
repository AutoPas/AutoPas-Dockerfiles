FROM autopas/build-base:latest

# install graphviz
RUN true \
	&& apt-get -qq update \
	&& apt-get -qq install -y --no-install-recommends \
        ca-certificates \
		graphviz \
        python3 \
        flex \
        bison \
	&& rm -rf /var/lib/apt/lists/*

RUN update-ca-certificates

# install doxygen from git for most recent version
RUN git clone https://github.com/doxygen/doxygen.git
RUN mkdir doxygen/myBuild \
    && cd doxygen/myBuild \
    && cmake -G Ninja -DCMAKE_BUILD_TYPE=Release .. \
    && ninja \
    && ninja install

CMD ["sh", "-c", "cmake ../.. >/dev/null && echo \"\ndoxygen warnings:\" && make doc_doxygen > /dev/null"]
