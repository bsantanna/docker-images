#!/usr/bin/env bash


echo "docker pull 'bsantanna/npm-dev:armhf'" | bash -x
echo "docker build -t 'bsantanna/npm-dev:armhf' ../.." | bash -x