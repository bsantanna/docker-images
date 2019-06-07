#!/usr/bin/env bash


echo "docker pull 'bsantanna/maven-build:x86_64'" | bash -x
echo "docker build -t 'bsantanna/maven-build:x86_64' ../.." | bash -x