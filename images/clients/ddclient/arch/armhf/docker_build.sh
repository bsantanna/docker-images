#!/usr/bin/env bash

echo "docker pull 'bsantanna/ddclient:armhf'" | bash -x
echo "docker build -t 'bsantanna/ddclient:armhf' ../../" | bash -x