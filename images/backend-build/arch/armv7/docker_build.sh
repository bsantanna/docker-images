#!/usr/bin/env bash

docker pull "bsantanna/backend-build-armv7"
docker build -t "bsantanna/backend-build-armv7" ../..