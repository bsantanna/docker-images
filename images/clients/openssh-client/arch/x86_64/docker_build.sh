#!/usr/bin/env bash

docker pull "bsantanna/openssh-client-x86_64"
docker build -t "bsantanna/openssh-client-x86_64" ../../