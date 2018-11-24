#!/usr/bin/env bash

docker pull "bsantanna/openjdk-11-jdk-x86_64"
docker build -t "bsantanna/openjdk-11-jdk-x86_64" .