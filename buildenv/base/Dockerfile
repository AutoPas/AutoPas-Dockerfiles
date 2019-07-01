FROM ubuntu:18.04

# install base requirements
RUN true \
	&& apt-get -qq update \
	&& apt-get -qq install -y --no-install-recommends \
		build-essential \
		ninja-build \
		wget \
		gdb \
		git \
		ccache \
		ssh \
		gnupg \
	&& rm -rf /var/lib/apt/lists/*

# we might want to fix the certificate stuff
RUN wget -O cmakeInstallScript.sh https://github.com/Kitware/CMake/releases/download/v3.14.5/cmake-3.14.5-Linux-x86_64.sh --no-check-certificate \
    && chmod +x cmakeInstallScript.sh \
    && ./cmakeInstallScript.sh --skip-license \
    && rm cmakeInstallScript.sh

# if we ever need to switch to manual install
# RUN apt-get -qq install -y cmake \
    # && wget https://github.com/Kitware/CMake/releases/download/v3.15.0-rc3/cmake-3.15.0-rc3.tar.gz \
    # && tar -xzf cmake-3.15.0-rc3.tar.gz \
    # && cd $_ \
    # && mkdir build \
    # && cd build \
    # && cmake .. \
    # && make -j4 \
    # && make install

ENTRYPOINT []
