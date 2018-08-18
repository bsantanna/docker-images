#!/usr/bin/env bash

docker pull "bsantanna/nfs-x86_64"
docker build -t "bsantanna/nfs-x86_64" .