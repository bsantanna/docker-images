#!/bin/bash

rpcdebug -m nfs -s proc

service nfs-kernel-server start

tail -v /var/log/messages
