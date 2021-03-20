# Multi-stage approach
FROM gradle:6.0.1-jdk8 as builder
USER root
RUN mkdir /app
WORKDIR /app
COPY . .
RUN gradle build

FROM jboss/wildfly
USER jboss
RUN /opt/jboss/wildfly/bin/add-user.sh admin Jboss@admin01 --silent
ENV ARTIFACT_NAME=resteasy-dockerized-api.war
COPY --from=builder /app/build/libs/$ARTIFACT_NAME /opt/jboss/wildfly/standalone/deployments/
# JBoss ports
EXPOSE 8080 9990 8009
CMD ["/opt/jboss/wildfly/bin/standalone.sh", "-b", "0.0.0.0", "-bmanagement", "0.0.0.0", "-c", "standalone.xml"]
