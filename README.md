WildFly 9.0.0.Final with OpenJDK 1.8
====================================

1. To boot in standalone mode:
==========================

```sh
docker run -it -p 8080:8080 -p 9990:9990 emedeiros/wildfly /opt/wildfly-9.0.0.Final/bin/standalone.sh -b 0.0.0.0 -bmanagement 0.0.0.0
```

2. To boot in domain mode:
==========================

```sh
docker run -it -p 8080:8080 -p 9990:9990 emedeiros/wildfly /opt/wildfly-9.0.0.Final/bin/domain.sh -b 0.0.0.0 -bmanagement 0.0.0.0
```

3. Console access:
==================

Url: ``http://your.ip:9990``
User: ``admin``
Password: ``wildfly``