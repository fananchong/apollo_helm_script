#!/bin/bash

values_file=${1}

if [ "${values_file}" == "" ]; then
    echo "Usage: ./setup_env.sh [values yml file]"
    exit 1
fi

if [ ! -f "${values_file}" ]; then
    echo "${values_file} does not exist"
    exit 1
fi

set -ex

env=$(cat ${values_file} | grep env_name | awk -F' ' '{print $2}')
workspace=$(pwd)/${env}
mkdir -p ${workspace}

helm template -f ${values_file} env >${workspace}/docker-compose.yml
pushd ${workspace}
docker-compose up -d
popd
