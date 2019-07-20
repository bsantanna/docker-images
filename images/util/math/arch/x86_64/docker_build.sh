#!/usr/bin/env bash


echo "docker pull 'bsantanna/util-math:x86_64'" | bash -x
echo "docker build -t 'bsantanna/util-math:x86_64' ../.." | bash -x