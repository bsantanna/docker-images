#!/usr/bin/env bash


docker pull "bsantanna/backend-build-x86_64"
docker build -t "bsantanna/backend-build-x86_64" ../..