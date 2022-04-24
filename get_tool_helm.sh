#!/bin/bash

set -x

which helm
if [ "$?" != "0" ]; then
    curl -o helm-v3.8.2-linux-amd64.tar.gz https://get.helm.sh/helm-v3.8.2-linux-amd64.tar.gz
    tar -zxvf helm-v3.8.2-linux-amd64.tar.gz
    sudo cp linux-amd64/helm /usr/local/bin
    rm -rf linux-amd64
    rm -rf helm-v3.8.2-linux-amd64.tar.gz
fi
