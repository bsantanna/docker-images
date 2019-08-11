#!/bin/sh

/etc/init.d/rpcbind start
unfsd -u -p -d
