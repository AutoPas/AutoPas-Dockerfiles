FROM autopas/build-base

ENV CLANGVERSION 13

# add llvm repository
RUN echo "deb http://apt.llvm.org/${UBUNTUVERSION}/ llvm-toolchain-${UBUNTUVERSION}-${CLANGVERSION} main\n\
deb-src http://apt.llvm.org/${UBUNTUVERSION}/ llvm-toolchain-${UBUNTUVERSION}-${CLANGVERSION} main\n" >> /etc/apt/sources.list.d/llvm.list

# add llvm repo key
RUN wget --no-check-certificate -O - https://apt.llvm.org/llvm-snapshot.gpg.key|apt-key add -

# install stuff
# openmpi 4.0.3 still has a memory leak, hence install mpich
RUN true \
    && apt-get -qq update \
    && apt-get -qq install -y --no-install-recommends \
        clang-${CLANGVERSION} \
        lldb-${CLANGVERSION} \
        libmpich-dev \
        libomp-${CLANGVERSION}-dev \
        clang-format-${CLANGVERSION} \
        python3-pip \
        python3-setuptools \
    && rm -rf /var/lib/apt/lists/*
RUN pip3 install --upgrade cmake-format

# generate version agnostic links to clang
RUN ln -s /usr/bin/clang-${CLANGVERSION} /usr/bin/clang
RUN ln -s /usr/bin/clang++-${CLANGVERSION} /usr/bin/clang++
RUN ln -s /usr/bin/llvm-config-${CLANGVERSION} /usr/bin/llvm-config


CMD ["sh", "-c", "echo 'Formatting code...' && cmake -G Ninja -DAUTOPAS_OPENMP=ON ../.. > /dev/null && ninja clangformat > /dev/null && ninja cmakeformat > /dev/null && echo 'done' && ninja && ninja test"]
