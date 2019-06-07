#!/usr/bin/env bash

echo "docker pull 'bsantanna/nginx-ssl-proxy:x86_64'" | bash -x
echo "docker build -t 'bsantanna/nginx-ssl-proxy:x86_64' ../.." | bash -x