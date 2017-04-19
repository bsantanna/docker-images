#!/bin/bash

rpcdebug -m nfs -s proc

service rpcbind start
service nfs-kernel-server start

sleep infinity
