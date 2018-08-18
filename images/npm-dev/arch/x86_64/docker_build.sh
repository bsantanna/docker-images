#!/usr/bin/env bash


docker pull "bsantanna/npm-dev-x86_64"
docker build -t "bsantanna/npm-dev-x86_64" ../..