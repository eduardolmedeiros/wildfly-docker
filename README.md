#  WildFly with OpenJDK 8

This is a docker image with WildFly (centos8 based) that ships a hello world java application. 
Useful for demo and labs.

## 1. To boot in standalone mode:

```sh
docker run -it -p 8080:8080 -p 9990:9990 emedeiros/wildfly
```

## 2. To boot in domain mode:

```
docker run -it -p 8080:8080 -p 8230:8230 -p 8330:8330 -p 9990:9990 emedeiros/wildfly /opt/wildfly/bin/domain.sh -b 0.0.0.0 -bmanagement 0.0.0.0
```

### Details about servers instances:

```
Server             | Port
-------------------| --------
server-one         | 8080
server-two         | 8230
server-three (off) | 8330
```

## 3. Console access:

Details to access web-console:

```
Name          | Description
------------- | -------------
URL           | http://your.ip:9990/console
User          | admin
Password      | wildfly
```
