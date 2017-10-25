#!/usr/bin/env bash

function showUsage {
    printf "Usage: $0 username realm password \n\n"
}

if [ -z "$3" ]; then
    showUsage
else
    user=$1
    realm=$2
    pass=$3
    hash=`echo -n "${user}:${realm}:${pass}" | md5sum | cut -b -32`
    echo "${user}:${realm}:${hash}"
fi

