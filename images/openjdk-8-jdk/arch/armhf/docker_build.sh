#!/usr/bin/env bash

docker pull "bsantanna/openjdk-8-jdk-armhf"
docker build -t "bsantanna/openjdk-8-jdk-armhf" ../..