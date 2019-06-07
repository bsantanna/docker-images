#!/usr/bin/env bash

echo "docker pull 'bsantanna/rdesktop:x86_64'" | bash -x
echo "docker build -t 'bsantanna/rdesktop:x86_64' ../../" | bash -x