FROM autopas/build-base

ENV CLANGVERSION=16

# Add llvm repository (can be used to get newer clang versions)
# RUN echo "deb http://apt.llvm.org/${UBUNTUVERSION}/ llvm-toolchain-${UBUNTUVERSION}-${CLANGVERSION} main\n\
# deb-src http://apt.llvm.org/${UBUNTUVERSION}/ llvm-toolchain-${UBUNTUVERSION}-${CLANGVERSION} main\n" >> /etc/apt/sources.list.d/llvm.list

# add llvm repo key
# RUN wget --no-check-certificate -O - https://apt.llvm.org/llvm-snapshot.gpg.key|apt-key add -

# install stuff
RUN true \
    && apt-get -qq update \
    && apt-get -qq install -y --no-install-recommends \
        clang-${CLANGVERSION} \
        lldb-${CLANGVERSION} \
        libclang-rt-${CLANGVERSION}-dev \
        libomp-${CLANGVERSION}-dev \
        clang-format-${CLANGVERSION} \
        cmake-format \
        python3-dev \
    && rm -rf /var/lib/apt/lists/*

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

# generate version agnostic links to clang
RUN ln -s /usr/bin/clang-${CLANGVERSION} /usr/bin/clang
RUN ln -s /usr/bin/clang++-${CLANGVERSION} /usr/bin/clang++
RUN ln -s /usr/bin/llvm-config-${CLANGVERSION} /usr/bin/llvm-config


CMD ["sh", "-c", "echo 'Formatting code...' && cmake -G Ninja -DAUTOPAS_OPENMP=ON ../.. > /dev/null && ninja clangformat > /dev/null && ninja cmakeformat > /dev/null && echo 'done' && ninja && ninja test"]
