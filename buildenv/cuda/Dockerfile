FROM nvidia/cuda:10.0-devel-ubuntu18.04

# install base requirements
RUN true \
	&& apt-get -qq update \
	&& apt-get -qq install -y --no-install-recommends \
		build-essential \
		ninja-build \
		wget \
		gdb \
		python-pip \
		python-setuptools \
	&& rm -rf /var/lib/apt/lists/*
RUN pip install --upgrade pip
RUN pip install --upgrade cmake
