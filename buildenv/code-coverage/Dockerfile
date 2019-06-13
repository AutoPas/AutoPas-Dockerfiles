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
		python \
		lcov \
		gcovr \
		ccache \
	&& rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip
RUN pip install --upgrade cmake

ENTRYPOINT []
