FROM autopas/build-base:latest

# install openmpi requirements
RUN true \
    && apt-get -qq update \
    && apt-get -qq install -y --no-install-recommends \
        libopenmpi-dev \
    && rm -rf /var/lib/apt/lists/*

# wrap mpirun with a script that adds some flags
RUN mkdir /mpi_bkp \
    && mv /usr/bin/mpirun /mpi_bkp \
    && echo '/mpi_bkp/mpirun --oversubscribe --allow-run-as-root $@' > /usr/bin/mpirun \
    && chmod +x /usr/bin/mpirun

ENTRYPOINT []

CMD ["sh", "-c", "cmake -GNinja ../.. && ninja && ninja test"]
