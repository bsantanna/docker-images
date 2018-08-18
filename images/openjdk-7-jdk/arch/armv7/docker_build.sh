#!/usr/bin/env bash

docker pull "bsantanna/openjdk-7-jdk-armv7"
docker build -t "bsantanna/openjdk-7-jdk-armv7" ../..