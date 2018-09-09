#!/usr/bin/env bash

docker pull "bsantanna/chef-dev-x86_64"
docker build -t "bsantanna/chef-dev-x86_64" ../..