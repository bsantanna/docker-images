#!/usr/bin/env bash

echo "docker pull 'bsantanna/ddclient:x86_64'" | bash -x
echo "docker build -t 'bsantanna/ddclient:x86_64' ../../" | bash -x