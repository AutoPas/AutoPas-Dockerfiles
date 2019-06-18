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
		libopenmpi-dev \
		openmpi-bin \
		gdb \
		git \
		python-setuptools \
		python \
		ccache \
	&& rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip
RUN pip install --upgrade cmake
RUN rm /usr/bin/mpirun
RUN echo '/etc/alternatives/mpirun --oversubscribe --allow-run-as-root $@' > /usr/bin/mpirun
RUN chmod +x /usr/bin/mpirun
ENTRYPOINT []
