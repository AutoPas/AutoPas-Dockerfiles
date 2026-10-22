#!/bin/bash


# name pattern for base is slightly different so pull it from the loop
docker build base -t autopas/build-base
docker push autopas/build-base:latest

for name in clang gcc archer doxygen
do
    docker build "${name}" -t autopas/autopas-build-${name}
    docker push autopas/autopas-build-${name}:latest
done
