#!/usr/bin/env bash

docker pull "bsantanna/nginx-static-x86_64"
docker build -t "bsantanna/nginx-static-x86_64" ../..