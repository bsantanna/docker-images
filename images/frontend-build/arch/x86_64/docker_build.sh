#!/usr/bin/env bash

docker pull "bsantanna/frontend-build-x86_64"
docker build -t "bsantanna/frontend-build-x86_64" ../..