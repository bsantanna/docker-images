#!/usr/bin/env bash

echo "docker pull 'bsantanna/rdesktop:armhf'" | bash -x
echo "docker build -t 'bsantanna/rdesktop:armhf' ../../" | bash -x