FROM nvidia/cuda:10.0-devel-ubuntu18.04

# install base requirements
RUN true \
	&& apt-get -qq update \
	&& apt-get -qq install -y --no-install-recommends \
		build-essential \
		ninja-build \
		wget \
		gdb \
	&& rm -rf /var/lib/apt/lists/*

RUN wget -O cmakeInstallScript.sh https://github.com/Kitware/CMake/releases/download/v3.14.5/cmake-3.14.5-Linux-x86_64.sh --no-check-certificate \
    && chmod +x cmakeInstallScript.sh \
    && ./cmakeInstallScript.sh --skip-license \
    && rm cmakeInstallScript.sh

CMD ["sh", "-c", "cmake -DAUTOPAS_ENABLE_CUDA=ON -GNinja ../.. && ninja && ninja test"]
