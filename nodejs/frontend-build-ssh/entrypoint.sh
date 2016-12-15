#!/usr/bin/env bash

git clone ${REPOSITORY_URL} .;
git pull;
npm install;
bower update --allow-root;
npm run build;
