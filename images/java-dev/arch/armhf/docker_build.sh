#!/usr/bin/env bash

docker pull "bsantanna/java-dev-armhf"
docker build -t "bsantanna/java-dev-armhf" ../..