#!/usr/bin/env bash

echo "docker pull 'bsantanna/maven-build'" | bash -x
echo "docker build -t 'bsantanna/maven-build-armhf' ../.." | bash -x