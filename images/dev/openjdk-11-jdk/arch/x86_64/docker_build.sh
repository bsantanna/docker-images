#!/usr/bin/env bash

echo "docker pull 'bsantanna/openjdk-11-jdk'" | bash -x
echo "docker build -t 'bsantanna/openjdk-11-jdk-x86_64' ." | bash -x