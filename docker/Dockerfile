FROM maven:3.5.2-jdk-8 as builder
LABEL maintainer="skl1f@ukrgadget.com"

WORKDIR "/tmp/"

ENV jdbc_url="jdbc:mysql://localhost/bookstore?createDatabaseIfNotExist=true&amp;amp;useUnicode=true&amp;amp;characterEncoding=utf-8&amp;amp;autoReconnect=true"
ENV jdbc_username="root"
ENV jdbc_password="toor"

RUN git clone https://github.com/skl1f/bookstore.git && \
    cd bookstore && \
    mvn -Djdbc_url=$jdbc_url -Djdbc_username=$jdbc_username -Djdbc_password=$jdbc_password package

FROM tomcat:8.0
WORKDIR $CATALINA_HOME/webapps
COPY --from=builder /tmp/bookstore/target/*.war .
