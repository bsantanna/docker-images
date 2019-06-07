#!/usr/bin/env bash

echo "docker pull 'bsantanna/squid-proxy:armhf'" | bash -x
echo "docker build -t 'bsantanna/squid-proxy:armhf' ../../" | bash -x