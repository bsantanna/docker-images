#!/usr/bin/env bash

docker pull "bsantanna/jenkins-docker-sshd-agent-armhf"
docker build -t "bsantanna/jenkins-docker-sshd-agent-armhf" ../..