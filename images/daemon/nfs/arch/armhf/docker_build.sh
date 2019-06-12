#!/usr/bin/env bash

echo "docker pull 'bsantanna/nfs:armhf'" | bash -x
echo "docker build -t 'bsantanna/nfs:armhf' ../../" | bash -x