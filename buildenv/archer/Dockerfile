FROM autopas/build-base

RUN true \
    && apt-get -qq update \
    && apt-get -qq install -y --no-install-recommends \
        ca-certificates \
    && rm -rf /var/lib/apt/lists/*

ENV CLANGVERSION=16

# Add llvm repository (can be used to get newer versions of clang)
# RUN echo "deb http://apt.llvm.org/${UBUNTUVERSION}/ llvm-toolchain-${UBUNTUVERSION}-${CLANGVERSION} main\n\
# deb-src http://apt.llvm.org/${UBUNTUVERSION}/ llvm-toolchain-${UBUNTUVERSION}-${CLANGVERSION} main" > /etc/apt/sources.list.d/llvm.list

# add llvm repo key
#  RUN wget --no-check-certificate -O - https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add -

# install clang llvm and python3-dev
RUN true \
    && apt-get -qq update \
    && apt-get -qq install -y --no-install-recommends \
        clang-${CLANGVERSION} \
        lldb-${CLANGVERSION} \
        libclang-rt-${CLANGVERSION}-dev \
        unzip \
	    python3-dev \
    && rm -rf /var/lib/apt/lists/*

# generate links to clang
RUN ln -s /usr/bin/clang-${CLANGVERSION} /usr/bin/clang
RUN ln -s /usr/bin/clang++-${CLANGVERSION} /usr/bin/clang++
RUN ln -s /usr/bin/llvm-config-${CLANGVERSION} /usr/bin/llvm-config

# build everything in /ArcherBuild
ENV ARCHER_BUILD=/ArcherBuild
RUN mkdir $ARCHER_BUILD
WORKDIR $ARCHER_BUILD

# disable git https check
RUN git config --global http.sslVerify false

#get, build and install openmp runtime
RUN git clone https://github.com/llvm/llvm-project --depth 1 -b release/${CLANGVERSION}.x llvm

ENV OPENMP_INSTALL=/usr/local

# Need to install llvm-config first
WORKDIR llvm
RUN mkdir build
WORKDIR build
RUN cmake -G Ninja \
    -D LLVM_ENABLE_PROJECTS="" \
    -D LLVM_TARGETS_TO_BUILD="X86" \
    -D LLVM_INCLUDE_TESTS=OFF \
    -D LLVM_INCLUDE_BENCHMARKS=OFF \
    -D LLVM_INCLUDE_EXAMPLES=OFF \
    -D CMAKE_BUILD_TYPE=Release \
    -D CMAKE_INSTALL_PREFIX=${OPENMP_INSTALL} \
    ../llvm
RUN ninja llvm-config
RUN ninja install

# Then install llvm openmp runtime which includes archer
WORKDIR ../openmp
RUN mkdir build
WORKDIR build
RUN cmake -G Ninja \
    -D CMAKE_C_COMPILER=clang \
    -D CMAKE_CXX_COMPILER=clang++ \
    -D CMAKE_BUILD_TYPE=RELEASE \
    -D CMAKE_INSTALL_PREFIX=${OPENMP_INSTALL} \
    -D LIBOMP_OMPT_SUPPORT=ON \
    ..
RUN ninja
RUN ninja install
WORKDIR /

