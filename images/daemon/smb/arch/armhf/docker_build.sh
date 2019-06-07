#!/usr/bin/env bash

echo "docker pull 'bsantanna/smb:armhf'" | bash -x
echo "docker build -t 'bsantanna/smb:armhf' ../../" | bash -x