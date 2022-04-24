#!/bin/bash

set -ex

helm template -f values_portal.yml portal >portal/docker-compose.yml
pushd portal
docker-compose up -d
popd
