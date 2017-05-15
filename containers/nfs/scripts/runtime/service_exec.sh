#!/bin/bash

rpcdebug -m nfs -s proc

mkdir -p "/run/sendsigs.omit.d/rpcbind"
service rpcbind start

service nfs-kernel-server start

sleep infinity
