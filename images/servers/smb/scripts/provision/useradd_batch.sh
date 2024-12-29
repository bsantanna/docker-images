#!/bin/bash

for line in `cat /config/users.txt`
do
  username=`echo ${line} | cut -f1 -d:`
  uid=`echo ${line} | cut -f3 -d:`
  bash -x -c "useradd -d /homes/${username} -s /bin/false --uid ${uid} ${username}"
done