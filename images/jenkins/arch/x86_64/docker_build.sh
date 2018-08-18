#!/usr/bin/env bash

docker pull "bsantanna/jenkins-x86_64"
docker build -t "bsantanna/jenkins-x86_64" ../..