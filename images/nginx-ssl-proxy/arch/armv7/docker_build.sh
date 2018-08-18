#!/usr/bin/env bash

docker pull "bsantanna/nginx-ssl-proxy-armv7"
docker build -t "bsantanna/nginx-ssl-proxy-armv7" ../..