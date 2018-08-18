#!/usr/bin/env bash


docker pull "bsantanna/maven-build-x86_64"
docker build -t "bsantanna/maven-build-x86_64" ../..