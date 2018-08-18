#!/usr/bin/env bash

docker pull "bsantanna/jenkins-docker-jnlp-agent-armv7"
docker build -t "bsantanna/jenkins-docker-jnlp-agent-armv7" ../..