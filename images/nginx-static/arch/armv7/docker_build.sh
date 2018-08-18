#!/usr/bin/env bash

docker pull "bsantanna/nginx-static-armv7"
docker build -t "bsantanna/nginx-static-armv7" ../..