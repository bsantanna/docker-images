#!/usr/bin/env bash

docker pull "bsantanna/chromium-kiosk-x86_64"
docker build -t "bsantanna/chromium-kiosk-x86_64" ../..