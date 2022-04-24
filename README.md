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

**启动 portal**

执行：

```shell
./setup_portal.sh
```

## 部署 Apollo 环境

举例，这里做一个 develop 环境，给开发人员使用

**配置 develop 相关信息**

执行，并填写相关信息：

```shell
vi values_env_develop.yml
```

**启动 develop 环境**

```shell
./setup_env.sh ./values_env_develop.yml
```

**develop 环境，注册 portal**

portal ApolloPortalDB 库，更细类似以下 SQL ：

```sql
UPDATE `ServerConfig` SET `Value`='develop' WHERE `Key`='apollo.portal.envs';
UPDATE `ServerConfig` SET `Value`='{\"develop\":\"http://172.26.144.21:8081/\"}' WHERE `Key`='apollo.portal.meta.servers';
```
