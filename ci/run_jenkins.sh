#!/usr/bin/env bash

docker stop btech-jenkins-docker

docker rm btech-jenkins-docker

docker run -d \
  --name btech-jenkins-docker \
  --privileged \
  -p 8080:8080 \
  -v "$(pwd)/workspace":/opt/jenkins/data/workspace \
  bsantanna/jenkins-docker
