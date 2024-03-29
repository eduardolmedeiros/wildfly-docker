FROM almalinux:8
LABEL maintainer=eduardo@dotmac.com.br

# Expose the ports
EXPOSE 8080
EXPOSE 9990

# Set the WILDFLY_VERSION env variable
ENV WILDFLY_VERSION 26.1.1.Final

# Add user and group wildfly
RUN groupadd wildfly && \
    adduser -g wildfly wildfly

# Install JDK 11
ENV JAVA_VERSION 11

RUN yum install java-$JAVA_VERSION-openjdk -y && \
    yum clean all

# Download and install WildFly
RUN curl -L -o wildfly-$WILDFLY_VERSION.tar.gz https://github.com/wildfly/wildfly/releases/download/$WILDFLY_VERSION/wildfly-$WILDFLY_VERSION.tar.gz && \
    tar xzvf wildfly-$WILDFLY_VERSION.tar.gz -C /opt && \
    ln -s /opt/wildfly-$WILDFLY_VERSION /opt/wildfly && \
    chown -R wildfly:wildfly /opt/wildfly-$WILDFLY_VERSION && \
    rm wildfly-$WILDFLY_VERSION.tar.gz

# Add user admin / pass: wildfly
USER wildfly
RUN /opt/wildfly/bin/add-user.sh admin wildfly --silent

# Deploy
USER wildfly
ADD hello.war /opt/wildfly/standalone/deployments/

# Set the default command to run on boot
# This will boot WildFly in the standalone mode and bind to all interface
USER wildfly
CMD ["/opt/wildfly/bin/standalone.sh", "-b", "0.0.0.0", "-bmanagement", "0.0.0.0"]
