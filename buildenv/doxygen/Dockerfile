FROM autopas/build-base:latest

# install doxygen
RUN true \
	&& apt-get -qq update \
	&& apt-get -qq install -y --no-install-recommends \
		doxygen \
		graphviz \
	&& rm -rf /var/lib/apt/lists/*
