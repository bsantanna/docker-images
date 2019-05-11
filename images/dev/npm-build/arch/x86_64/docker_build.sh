#!/usr/bin/env bash

echo "docker pull 'bsantanna/npm-build'" | bash -x
echo "docker build -t 'bsantanna/npm-build-x86_64' ../.." | bash -x