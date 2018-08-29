#!/usr/bin/env bash

docker pull "bsantanna/openjdk-7-jdk-armhf"
docker build -t "bsantanna/openjdk-7-jdk-armhf" .