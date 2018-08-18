#!/usr/bin/env bash

docker pull "bsantanna/openjdk-8-jdk-armv7"
docker build -t "bsantanna/openjdk-8-jdk-armv7" ../..