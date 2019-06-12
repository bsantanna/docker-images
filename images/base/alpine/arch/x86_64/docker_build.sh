#!/usr/bin/env bash

echo "docker pull 'bsantanna/alpine:x86_64'" | bash -x
echo "docker build -t 'bsantanna/alpine:x86_64' ." | bash -x