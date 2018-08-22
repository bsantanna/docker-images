#!/usr/bin/env bash

docker pull "bsantanna/java-dev-x86_64"
docker build -t "bsantanna/java-dev-x86_64" ../..