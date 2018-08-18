#!/usr/bin/env bash

docker pull "bsantanna/jenkins-docker-jnlp-agent-armhf"
docker build -t "bsantanna/jenkins-docker-jnlp-agent-armhf" ../..