#!/bin/bash

for line in `cat /config/users.txt`
do
  USERNAME=`echo $line | cut -f1 -d:`
  useradd -d /homes/$USERNAME -s /bin/false $USERNAME
done
