#!/usr/bin/env bash

echo "docker pull 'bsantanna/alpine'" | bash -x
echo "docker build -t 'bsantanna/alpine-armhf' ../../" | bash -x