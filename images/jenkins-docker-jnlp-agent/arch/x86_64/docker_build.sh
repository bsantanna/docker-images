#!/usr/bin/env bash

docker pull "bsantanna/jenkins-docker-jnlp-agent-x86_64"
docker build -t "bsantanna/jenkins-docker-jnlp-agent-x86_64" ../..