#!/usr/bin/env bash

docker pull "bsantanna/nginx-ssl-proxy-x86_64"
docker build -t "bsantanna/nginx-ssl-proxy-x86_64" ../..