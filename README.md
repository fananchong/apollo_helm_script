## Apollo 部署拓扑图


```shell
                                   +------------------------------+
                                   | env staging(aliyun)          |
                                   |                              |
                        +--------->|      config/admin            |
                        |          |                              |
                        |          +------------------------------+
                        |
                        |
                        |          +------------------------------+
                        |          | env sv(aliyun)               |
+----------------+      |          |                              |
|   portal/UI    +------+--------> |      config/admin            |
+----------------+      |          |                              |
                        |          +------------------------------+
                        |
                        |
                        |           ...
                        |
                        |          +------------------------------+
                        |          |                              |
                        |          |  Office LAN                  |
                        +--------->|                              |
                                   |  +----------------------+    |
                                   |  | env xxxx(virtaul)    |    |
                                   |  |                      |    |
                                   |  |      config/admin    |    |
                                   |  |                      |    |
                                   |  +----------------------+    |
                                   |                              |
                                   |  +----------------------+    |
                                   |  | env develop(virtaul) |    |
                                   |  |                      |    |
                                   |  |      config/admin    |    |
                                   |  |                      |    |
                                   |  +----------------------+    |
                                   |                              |
                                   +------------------------------+
```

实际操作， 办公内网可能与阿里云不直接互通。会有 2 个 portal/UI ，分别对应办公内网、aliyun

## 准备

**获取 helm**

执行：

```shell
./get_tool_helm.sh
```

**获取 Apollo 需要的 SQL 文**

执行：

```shell
./get_apollo_sql.sh
```

## 部署 portal

**配置 portal 相关信息**

执行，并填写相关信息：

```shell
vi values_portal.yml
```

有以下字段

| 字段             | 说明                        |
| :--------------- | :-------------------------- |
| portal_db_user   | portal 服对应数据库账号     |
| portal_db_passwd | portal 服对应数据库密码     |
| portal_db_port   | portal 服对应数据库端口     |
| portal_db_dir    | portal 服对应数据库挂接目录 |
| portal_port      | portal 服服务端口           |
| portal_log_dir   | portal 服对应日志挂接目录   |
| portal_envs      | portal 服设置环境           |
| apollo_version   | Apollo 版本                 |

如，像设置 1 个环境： develop ，则 portal_envs 字段填：
```yml
  develop: http://172.26.144.21:8082
```
URL 为各环境的 config 服地址

**启动 portal**

执行：

```shell
./setup_portal.sh
```

**重启 portal**

```shell
./restart_portal.sh
```

## 部署 Apollo 环境

举例，这里做一个 develop 环境，给开发人员使用

**配置环境**

执行，并填写相关信息：

```shell
vi values_env_develop.yml
```

有以下字段:

| 字段            | 说明                              |
| :-------------- | :-------------------------------- |
| env_name        | 环境名称                          |
| env_db_user     | config/admin 服对应数据库账号     |
| env_db_passwd   | config/admin 服对应数据库密码     |
| env_db_port     | config/admin 服对应数据库端口     |
| env_db_dir      | config/admin 服对应数据库挂接目录 |
| env_host        | 该环境服务部署 Apollo 的主机IP    |
| env_config_port | config 服服务端口                 |
| env_admin_port  | admin 服服务端口                  |
| env_log_dir     | config/admin 服对应日志挂接目录   |
| apollo_version  | Apollo 版本                       |

**启动环境**

```shell
./setup_env.sh ./values_env_develop.yml
```

**重启环境**

```shell
./restart_env.sh ./values_env_develop.yml
```

## 修改部门信息


默认安装，会有：`样例部门1(TEST1)`这样的例子部门信息

`系统参数`页面查找 `organizations` 修改；或执行 SQL ：

```sql
UPDATE `ServerConfig` SET `Value`='[{\"orgId\":\"Backend\",\"orgName\":\"Backend\"},{\"orgId\":\"QA\",\"orgName\":\"QA\"}]' WHERE `Key`='organizations';
```