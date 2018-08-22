#!/usr/bin/env bash

docker pull "bsantanna/docker-manifest-publisher-x86_64"
docker build -t "bsantanna/docker-manifest-publisher-x86_64" ../..