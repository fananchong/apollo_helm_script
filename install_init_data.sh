#!/bin/bash

## 初始化些初始数据（非必须）

set -ex

mysql -uroot -proot123456 -P33060 -h127.0.0.1 --default-character-set=utf8 ApolloPortalDB <./init_data/custom.sql
