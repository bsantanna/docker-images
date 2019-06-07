#!/usr/bin/env bash

echo "docker pull 'bsantanna/jenkins-docker-agent'" | bash -x
echo "docker build -t 'bsantanna/jenkins-docker-agent:x86_64' ../.." | bash -x