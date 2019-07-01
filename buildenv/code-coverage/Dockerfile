FROM autopas/build-base

# install base requirements
RUN true \
	&& apt-get -qq update \
	&& apt-get -qq install -y --no-install-recommends \
		lcov \
		gcovr \
	&& rm -rf /var/lib/apt/lists/*

ENTRYPOINT []
