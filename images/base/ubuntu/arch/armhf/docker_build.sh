#!/usr/bin/env bash

echo "docker pull 'bsantanna/ubuntu'" | bash -x
echo "docker build -t 'bsantanna/ubuntu-armhf' ../../" | bash -x