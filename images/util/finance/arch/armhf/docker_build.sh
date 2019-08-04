#!/usr/bin/env bash


echo "docker pull 'bsantanna/util-finance:armhf'" | bash -x
echo "docker build -t 'bsantanna/util-finance:armhf' ../.." | bash -x