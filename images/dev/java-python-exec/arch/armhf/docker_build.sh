#!/usr/bin/env bash

docker pull "bsantanna/java-python-exec-armhf"
docker build -t "bsantanna/java-python-exec-armhf" ../..