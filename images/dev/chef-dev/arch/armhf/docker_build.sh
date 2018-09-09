#!/usr/bin/env bash

docker pull "bsantanna/chef-dev-armhf"
docker build -t "bsantanna/chef-dev-armhf" ../..