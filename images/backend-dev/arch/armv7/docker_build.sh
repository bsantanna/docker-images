#!/usr/bin/env bash

docker pull "bsantanna/backend-dev-armv7"
docker build -t "bsantanna/backend-dev-armv7" ../..