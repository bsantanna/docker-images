#!/usr/bin/env bash

docker pull "bsantanna/chromium-kiosk-armhf"
docker build -t "bsantanna/chromium-kiosk-armhf" ../..