#!/usr/bin/env bash

echo "docker pull 'bsantanna/nfs:x86_64'" | bash -x
echo "docker build -t 'bsantanna/nfs:x86_64' ../../" | bash -x