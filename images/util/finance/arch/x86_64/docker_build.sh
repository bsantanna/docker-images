#!/usr/bin/env bash


echo "docker pull 'bsantanna/util-finance:x86_64'" | bash -x
echo "docker build -t 'bsantanna/util-finance:x86_64' ../.." | bash -x