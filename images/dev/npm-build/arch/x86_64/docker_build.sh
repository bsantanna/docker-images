#!/usr/bin/env bash

docker pull "bsantanna/npm-build-x86_64"
docker build -t "bsantanna/npm-build-x86_64" ../..