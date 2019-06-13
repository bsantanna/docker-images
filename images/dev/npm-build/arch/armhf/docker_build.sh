#!/usr/bin/env bash


echo "docker pull 'bsantanna/npm-build:armhf'" | bash -x
echo "docker build -t 'bsantanna/npm-build:armhf' ../.." | bash -x