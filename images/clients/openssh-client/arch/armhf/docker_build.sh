#!/usr/bin/env bash

echo "docker pull 'bsantanna/openssh-client:armhf'" | bash -x
echo "docker build -t 'bsantanna/openssh-client:armhf' ../../" | bash -x