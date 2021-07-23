FROM nvidia/cuda:10.1-devel-ubuntu18.04

ENV CLANGVERSION 8

RUN true \
    && apt-get -qq update \
    && apt-get -qq install -y --no-install-recommends \
        wget \
    && rm -rf /var/lib/apt/lists/*

# add llvm repository
RUN echo "deb http://apt.llvm.org/${UBUNTUVERSION}/ llvm-toolchain-${UBUNTUVERSION}-${CLANGVERSION} main\n\
deb-src http://apt.llvm.org/${UBUNTUVERSION}/ llvm-toolchain-${UBUNTUVERSION}-${CLANGVERSION} main\n" >> /etc/apt/sources.list.d/llvm.list

# add llvm repo key
RUN wget --no-check-certificate -O - https://apt.llvm.org/llvm-snapshot.gpg.key|apt-key add -

# install base requirements
RUN true \
    && apt-get -qq update \
    && apt-get -qq install -y --no-install-recommends \
        build-essential \
        ninja-build \
        wget \
        gdb \
        clang-${CLANGVERSION} \
        lldb-${CLANGVERSION} \
        libomp-dev \
        ccache \
    && rm -rf /var/lib/apt/lists/*

# generate links to clang
RUN ln -s /usr/bin/clang-${CLANGVERSION} /usr/bin/clang
RUN ln -s /usr/bin/clang++-${CLANGVERSION} /usr/bin/clang++
RUN ln -s /usr/bin/llvm-config-${CLANGVERSION} /usr/bin/llvm-config


RUN wget -O cmakeInstallScript.sh https://github.com/Kitware/CMake/releases/download/v3.14.5/cmake-3.14.5-Linux-x86_64.sh --no-check-certificate \
    && chmod +x cmakeInstallScript.sh \
    && ./cmakeInstallScript.sh --skip-license \
    && rm cmakeInstallScript.sh

CMD ["sh", "-c", "cmake -DAUTOPAS_ENABLE_CUDA=ON -GNinja ../.. && ninja && ninja test"]

COPY bin/entrypoint.sh /usr/local/bin
RUN ln -s /usr/local/bin/entrypoint.sh / # backwards compat

ENTRYPOINT ["entrypoint.sh"]
