#!/usr/bin/env bash

echo "docker pull 'bsantanna/util-math:armhf'" | bash -x
echo "docker build -t 'bsantanna/util-math:armhf' ../.." | bash -x