#!/bin/bash

set -ex

pushd portal
docker-compose restart
popd
