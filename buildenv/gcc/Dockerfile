FROM autopas/build-base

ENV GCCVERSION="13"

# install stuff
# install gcc-13, and set links to make it default
RUN true \
    && apt-get -qq update \
    && apt-get -qq install -y --no-install-recommends \
        autoconf \
        automake \
        g++-${GCCVERSION} \
        libtool \
        software-properties-common \
        python3-dev \
    && rm -rf /var/lib/apt/lists/* \
    && ln -s -f /usr/bin/gcc-${GCCVERSION} /usr/bin/gcc \
    && ln -s -f /usr/bin/g++-${GCCVERSION} /usr/bin/g++

# openmpi has memory leaks and mpich from apt has bugs
# install mpich from source
WORKDIR /tmp
RUN wget https://www.mpich.org/static/downloads/4.3.2rc2/mpich-4.3.2rc2.tar.gz && \
    tar -zxvf mpich-4.3.2rc2.tar.gz && \
    cd mpich-4.3.2rc2 && \
    ./configure --prefix=/usr --disable-fortran && \
    make && \
    make install && \
    ldconfig

ENV PATH=/usr/local/bin:$PATH 

# install lcov and set gcov-13
RUN cd \
    && perl -MCPAN -e 'install(Capture::Tiny, DateTime, Date::Parse, Cpanel::JSON::XS)' \
    && git clone https://github.com/linux-test-project/lcov.git \
    && cd lcov \
    && make install \
    && update-alternatives --install /usr/bin/gcov gcov /usr/bin/gcov-13 60 \
    && cd

CMD ["sh", "-c", "cmake -GNinja ../.. && ninja && ninja test"]
