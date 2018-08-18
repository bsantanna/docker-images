#!/usr/bin/env bash

docker pull "bsantanna/openssh-client-armhf"
docker build -t "bsantanna/openssh-client-armhf" ../../