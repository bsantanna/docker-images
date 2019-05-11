#!/usr/bin/env bash


echo "docker pull 'bsantanna/maven-build'" | bash -x
echo "docker build -t 'bsantanna/maven-build-x86_64' ../.." | bash -x