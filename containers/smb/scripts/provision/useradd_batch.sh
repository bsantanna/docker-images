#!/bin/bash

for line in `cat /config/users.txt`
do
  username=`echo ${line} | cut -f1 -d:`
  useradd -d /homes/${username} -s /bin/false ${username}
done