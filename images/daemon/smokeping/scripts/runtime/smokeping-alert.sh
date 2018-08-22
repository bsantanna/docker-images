#!/usr/bin/env bash

alert=$1
target=$2
loss=$3
rtt=$4
hostname=$5

echo "ALERT: \"${alert}\" \"${target}\" \"${loss}\" \"${rtt}\" \"${hostname}\" "  | tee /tmp/log