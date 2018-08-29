#!/usr/bin/env bash

docker pull "bsantanna/openjdk-8-jdk-x86_64"
docker build -t "bsantanna/openjdk-8-jdk-x86_64" .