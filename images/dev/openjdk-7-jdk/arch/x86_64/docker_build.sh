#!/usr/bin/env bash

echo "docker pull 'bsantanna/openjdk-7-jdk'" | bash -x
echo "docker build -t 'bsantanna/openjdk-7-jdk-x86_64' ." | bash -x