#!/usr/bin/env bash


echo "docker pull 'bsantanna/npm-dev:x86_64'" | bash -x
echo "docker build -t 'bsantanna/npm-dev:x86_64' ../.." | bash -x