FROM ubuntu:16.04

RUN true \
	&& apt-get -qq update \
	&& apt-get -qq install -y --no-install-recommends \
		build-essential \
		python-pip \
		doxygen \
		graphviz \
	&& rm -rf /var/lib/apt/lists/*
# install current cmake
RUN pip install --upgrade pip
RUN pip install --upgrade cmake
