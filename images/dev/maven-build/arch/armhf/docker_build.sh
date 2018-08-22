#!/usr/bin/env bash

docker pull "bsantanna/maven-build-armhf"
docker build -t "bsantanna/maven-build-armhf" ../..