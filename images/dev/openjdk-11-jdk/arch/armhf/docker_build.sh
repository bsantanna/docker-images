#!/usr/bin/env bash

docker pull "bsantanna/openjdk-11-jdk-armhf"
docker build -t "bsantanna/openjdk-11-jdk-armhf" .