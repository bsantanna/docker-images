#!/usr/bin/env bash

echo "docker pull 'bsantanna/jenkins-docker:x86_64'" | bash -x
echo "docker build -t 'bsantanna/jenkins-docker:x86_64' ../.." | bash -x