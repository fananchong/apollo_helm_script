#!/bin/bash

set -ex

version=v1.9.2

current_dir=$(pwd)
workspace=/tmp/apollo_code/
rm -rf ${workspace}
mkdir -p ${workspace}
pushd ${workspace}
if [ "${version}" == "latest" ]; then
    git clone --depth 1 https://github.com/apolloconfig/apollo.git
else
    git clone -b ${version} --depth 1 https://github.com/apolloconfig/apollo.git
fi
mkdir -p ${current_dir}/portal/sql ${current_dir}/env/sql
cp apollo/scripts/sql/apolloportaldb.sql ${current_dir}/portal/sql
cp apollo/scripts/sql/apolloconfigdb.sql ${current_dir}/env/sql
popd
rm -rf ${workspace}
