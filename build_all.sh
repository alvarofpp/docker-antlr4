#!/bin/bash

DOCKER_IMAGE="alvarofpp/antlr4"
VERSIONS=(
  4.9.3
)

for VERSION in "${VERSIONS[@]}"; do
  docker build --build-arg VERSION="${VERSION}" image/. -t "${DOCKER_IMAGE}":"${VERSION}"
done

docker build --build-arg VERSION="${VERSION}" image/. -t "${DOCKER_IMAGE}":latest
