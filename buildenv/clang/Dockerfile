FROM ubuntu:18.04

# install base requirements
RUN true \
	&& apt-get -qq update \
	&& apt-get -qq install -y --no-install-recommends \
		build-essential \
		ccache \
		python-pip \
		ninja-build \
		wget \
		gdb \
		git \
		python-setuptools \
		gnupg \
	&& rm -rf /var/lib/apt/lists/*
# install current cmake
RUN pip install --upgrade pip
RUN pip install --upgrade cmake
RUN pip install --upgrade cmake-format

# add llvm repository
RUN echo "deb http://apt.llvm.org/bionic/ llvm-toolchain-bionic-6.0 main\n\
deb-src http://apt.llvm.org/bionic/ llvm-toolchain-bionic-6.0 main\n" > /etc/apt/sources.list.d/llvm.list
RUN echo "deb http://apt.llvm.org/bionic/ llvm-toolchain-bionic-8 main\n\
deb-src http://apt.llvm.org/bionic/ llvm-toolchain-bionic-8 main\n" >> /etc/apt/sources.list.d/llvm.list

# add llvm repo key
RUN wget --no-check-certificate -O - https://apt.llvm.org/llvm-snapshot.gpg.key|apt-key add -

ENV CLANGVERSION 8
# install llvm
RUN true \
	&& apt-get -qq update \
	&& apt-get -qq install -y --no-install-recommends \
		clang-${CLANGVERSION} \
		lldb-${CLANGVERSION} \
		libomp-dev \
		clang-format-6.0 \
		clang-format-${CLANGVERSION} \
	&& rm -rf /var/lib/apt/lists/*

# generate links to clang
RUN ln -s /usr/bin/clang-${CLANGVERSION} /usr/bin/clang
RUN ln -s /usr/bin/clang++-${CLANGVERSION} /usr/bin/clang++
RUN ln -s /usr/bin/llvm-config-${CLANGVERSION} /usr/bin/llvm-config
