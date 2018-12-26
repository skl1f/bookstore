FROM maven:3.5.2-jdk-8 as builder
LABEL maintainer="skl1f@ukrgadget.com"

WORKDIR "/tmp/"

ADD src ./src/
ADD pom.xml .

RUN mvn package

FROM tomcat:8-jre8-alpine
WORKDIR $CATALINA_HOME/webapps
ADD tomcat/tomcat-users.xml $CATALINA_HOME/conf/tomcat-users.xml
ADD tomcat/manager_context.xml $CATALINA_HOME/conf/Catalina/localhost/manager.xml

COPY --from=builder /tmp/target/*.war .
