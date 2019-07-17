FROM autopas/build-base

# add llvm repository
#RUN echo "deb http://apt.llvm.org/xenial/ llvm-toolchain-xenial-5.0 main\n\
#deb-src http://apt.llvm.org/xenial/ llvm-toolchain-xenial-5.0 main" > /etc/apt/sources.list.d/llvm.list

# add llvm repo key
#RUN wget --no-check-certificate -O - https://apt.llvm.org/llvm-snapshot.gpg.key|apt-key add -

ENV CLANGVERSION 8
# install clang and llvm
RUN true \
	&& apt-get -qq update \
	&& apt-get -qq install -y --no-install-recommends \
		clang-${CLANGVERSION} \
		lldb-${CLANGVERSION} \
	&& rm -rf /var/lib/apt/lists/*

# generate links to clang
RUN ln -s /usr/bin/clang-${CLANGVERSION} /usr/bin/clang
RUN ln -s /usr/bin/clang++-${CLANGVERSION} /usr/bin/clang++
RUN ln -s /usr/bin/llvm-config-${CLANGVERSION} /usr/bin/llvm-config

# build everything in /ArcherBuild
ENV ARCHER_BUILD /ArcherBuild
RUN mkdir $ARCHER_BUILD
WORKDIR $ARCHER_BUILD

# disable git https check
RUN git config --global http.sslVerify false

#get, build and install openmp runtime from PRUNERS repository that includes archer.
RUN git clone https://github.com/PRUNERS/openmp.git openmp
ENV OPENMP_INSTALL /usr
WORKDIR openmp

# openmp release_80_reduction
RUN git checkout 3ba79f8

RUN mkdir build
WORKDIR build
RUN cmake -G Ninja \
 -D CMAKE_C_COMPILER=clang \
 -D CMAKE_CXX_COMPILER=clang++ \
 -D CMAKE_BUILD_TYPE=Release \
 -D CMAKE_INSTALL_PREFIX:PATH=$OPENMP_INSTALL \
 -D LIBOMP_OMPT_SUPPORT=on \
 -D LIBOMP_OMPT_OPTIONAL=on \
 ..
RUN ninja
RUN ninja install

ENV TSAN_OPTIONS 'ignore_noninstrumented_modules=1'

CMD ["sh", "-c", "CXXFLAGS=-Wno-pass-failed CC=clang CXX=clang++ cmake -G Ninja -DCMAKE_BUILD_TYPE=Debug -DAUTOPAS_USE_VECTORIZATION=OFF -DAUTOPAS_OPENMP=ON -DAUTOPAS_ENABLE_THREAD_SANITIZER=ON ../.. && ninja runTests && ctest -R 'Archer.*' --verbose"]

