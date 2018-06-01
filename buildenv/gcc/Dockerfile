FROM purplekarrot/gcc-7

RUN true \
	&& apt-get -qq update \
	&& apt-get -qq install -y --no-install-recommends \
		libopenmpi-dev \
	&& rm -rf /var/lib/apt/lists/*


ENTRYPOINT []
