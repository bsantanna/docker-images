#!/usr/bin/env bash

bash -c 'cd .. && for file in $(find . -name *.yml ); do echo $file; manifest pushml $file; done'