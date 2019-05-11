#!/usr/bin/env bash

echo "docker pull 'bsantanna/openssh-client'" | bash -x
echo "docker build -t 'bsantanna/openssh-client-x86_64' ../../" | bash -x