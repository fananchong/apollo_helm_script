UPDATE `ServerConfig` SET `Value`='develop' WHERE `Key`='apollo.portal.envs';
UPDATE `ServerConfig` SET `Value`='[{\"orgId\":\"Backend\",\"orgName\":\"Backend\"},{\"orgId\":\"QA\",\"orgName\":\"QA\"}]' WHERE `Key`='organizations';
UPDATE `ServerConfig` SET `Value`='develop' WHERE `Key`='configView.memberOnly.envs';
UPDATE `ServerConfig` SET `Value`='{\"develop\":\"http://172.26.144.21:8081/\"}' WHERE `Key`='apollo.portal.meta.servers';