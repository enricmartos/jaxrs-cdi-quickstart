FROM jboss/wildfly
USER jboss
RUN /opt/jboss/wildfly/bin/add-user.sh admin Jboss@admin01 --silent
# JBoss ports
COPY build/libs/jaxrs-cdi-quickstart.war /opt/jboss/wildfly/standalone/deployments/
# JBoss ports
EXPOSE 8080 9990 8009
# Run
CMD ["/opt/jboss/wildfly/bin/standalone.sh", "-b", "0.0.0.0", "-bmanagement", "0.0.0.0", "-c", "standalone.xml"]
