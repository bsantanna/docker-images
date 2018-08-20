#!/usr/bin/env bash

docker pull "bsantanna/jenkins-docker-sshd-agent-x86_64"
docker build -t "bsantanna/jenkins-docker-sshd-agent-x86_64" ../..