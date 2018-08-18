#!/usr/bin/env bash

docker pull "bsantanna/openjdk-7-jdk-x86_64"
docker build -t "bsantanna/openjdk-7-jdk-x86_64" ../..