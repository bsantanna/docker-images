#!/usr/bin/env bash

node proxy.js &
node_modules/weinre/weinre --httpPort 3002 --boundHost -all-