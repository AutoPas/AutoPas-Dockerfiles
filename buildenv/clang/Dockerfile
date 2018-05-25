FROM ubuntu:16.04

# install base requirements
RUN true \
	&& apt-get -qq update \
	&& apt-get -qq install -y --no-install-recommends \
		build-essential \
		cmake \
		ninja-build \
		wget \
		gdb \
		git \
	&& rm -rf /var/lib/apt/lists/*

# add llvm repository
#RUN echo "deb http://apt.llvm.org/xenial/ llvm-toolchain-xenial-5.0 main\n\
#deb-src http://apt.llvm.org/xenial/ llvm-toolchain-xenial-5.0 main" > /etc/apt/sources.list.d/llvm.list

# add llvm repo key
#RUN wget --no-check-certificate -O - https://apt.llvm.org/llvm-snapshot.gpg.key|apt-key add -

ENV CLANGVERSION 6.0
# install llvm
RUN true \
	&& apt-get -qq update \
	&& apt-get -qq install -y --no-install-recommends \
		clang-${CLANGVERSION} \
		lldb-${CLANGVERSION} \
		libomp-dev \
	&& rm -rf /var/lib/apt/lists/*

# generate links to clang
RUN ln -s /usr/bin/clang-${CLANGVERSION} /usr/bin/clang
RUN ln -s /usr/bin/clang++-${CLANGVERSION} /usr/bin/clang++
RUN ln -s /usr/bin/llvm-config-${CLANGVERSION} /usr/bin/llvm-config

