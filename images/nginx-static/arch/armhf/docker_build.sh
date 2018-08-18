#!/usr/bin/env bash

docker pull "bsantanna/nginx-static-armhf"
docker build -t "bsantanna/nginx-static-armhf" ../..