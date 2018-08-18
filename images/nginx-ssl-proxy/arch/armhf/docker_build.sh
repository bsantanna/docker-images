#!/usr/bin/env bash

docker pull "bsantanna/nginx-ssl-proxy-armhf"
docker build -t "bsantanna/nginx-ssl-proxy-armhf" ../..