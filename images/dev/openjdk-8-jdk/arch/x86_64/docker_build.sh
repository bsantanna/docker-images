#!/usr/bin/env bash

echo "docker pull 'bsantanna/openjdk-8-jdk'" | bash -x
echo "docker build -t 'bsantanna/openjdk-8-jdk-x86_64' ." | bash -x