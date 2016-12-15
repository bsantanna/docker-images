#!/usr/bin/env bash

git clone ${REPOSITORY_URL} .
git pull
bash -c "( cd ${PORTAL_VERSION} && npm install )"
bash -c "( cd ${PORTAL_VERSION} && bower update --allow-root )"
bash -c "( cd ${PORTAL_VERSION} && npm run build )"
