#!/usr/bin/env bash

docker pull "bsantanna/jenkins-docker-agent-armhf"
docker build -t "bsantanna/jenkins-docker-agent-armhf" ../..