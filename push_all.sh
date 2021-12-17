#!/bin/bash

DOCKER_IMAGE="alvarofpp/antlr4"
VERSIONS=(
  4.9.3
)

for VERSION in "${VERSIONS[@]}"; do
  docker push "${DOCKER_IMAGE}":"${VERSION}"
done

docker push "${DOCKER_IMAGE}":latest
