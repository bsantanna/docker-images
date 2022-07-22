#!/usr/bin/env bash

DOCKER_REGISTRY_USERNAME=""
DOCKER_REGISTRY_PASSWORD=""

SCRIPT_NAME=$(readlink -f "${0}")
SCRIPT_DIRECTORY=$(dirname "${SCRIPT_NAME}")

for PARENT_DIRECTORY in "${SCRIPT_DIRECTORY}"/* ; do
  if [ -d "${PARENT_DIRECTORY}" ]; then
    for IMAGE_DIRECTORY in "${PARENT_DIRECTORY}"/* ; do
      if [ -d "${IMAGE_DIRECTORY}" ]; then
        echo "Publishing ${IMAGE_DIRECTORY}"
        echo "docker run -i --rm \
                -e DOCKER_REGISTRY_USERNAME=${DOCKER_REGISTRY_USERNAME} \
                -e DOCKER_REGISTRY_PASSWORD=${DOCKER_REGISTRY_PASSWORD} \
                -v ${IMAGE_DIRECTORY}/arch/manifest.yml:/mnt/manifest.yml \
                   bsantanna/manifest-publisher /mnt/manifest.yml" | bash

      fi
    done
  fi
done
