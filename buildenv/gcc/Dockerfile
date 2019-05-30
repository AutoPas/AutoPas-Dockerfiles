FROM purplekarrot/gcc-7

RUN true \
	&& apt-get -qq update \
	&& apt-get -qq install -y --no-install-recommends \
		ccache \
		libopenmpi-dev \
	&& rm -rf /var/lib/apt/lists/*

RUN rm /usr/bin/mpirun
RUN echo '/etc/alternatives/mpirun --oversubscribe --allow-run-as-root $@' > /usr/bin/mpirun
RUN chmod +x /usr/bin/mpirun
ENTRYPOINT []
