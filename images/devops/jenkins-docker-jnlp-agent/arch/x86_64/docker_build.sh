#!/usr/bin/env bash

echo "docker pull 'bsantanna/jenkins-docker-jnlp-agent'" | bash -x
echo "docker build -t 'bsantanna/jenkins-docker-jnlp-agent-x86_64' ../.." | bash -x