#!/usr/bin/env bash

echo "docker pull 'bsantanna/jenkins'" | bash -x
echo "docker build -t 'bsantanna/jenkins-x86_64' ../.." | bash -x