FROM nvidia/cuda:10.0-devel-ubuntu18.04

# install base requirements
RUN true \
	&& apt-get -qq update \
	&& apt-get -qq install -y --no-install-recommends \
		build-essential \
		cmake \
		ninja-build \
		wget \
		gdb \
	&& rm -rf /var/lib/apt/lists/*

