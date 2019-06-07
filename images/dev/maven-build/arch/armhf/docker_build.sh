#!/usr/bin/env bash

echo "docker pull 'bsantanna/maven-build:armhf'" | bash -x
echo "docker build -t 'bsantanna/maven-build:armhf' ../.." | bash -x