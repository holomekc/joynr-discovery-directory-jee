FROM amazoncorretto:8

MAINTAINER holomekc.github@gmail.com

RUN yum install -y tar tar less procps wget curl shadow-utils.x86_64 which

ENV JAVA_APP_JAR="payara-micro-server.jar" \
  JAVA_ARGS="--deploy /home/app/discovery-directory.war --unpackdir /home/runtime --domainConfig /home/app/domain.xml"

USER 0

ARG PAYARA_VERSION=5.201
ARG POSTGRES_VERSION=42.2.5
ARG JOYNR_VERSION=1.4.0

ARG BUILD_DIR=./
WORKDIR /home/app
RUN mkdir ../runtime
RUN mkdir ../runtime/lib
RUN mkdir ../runtime/runtime

RUN echo "Download payara 5 micro"
RUN wget --no-check-certificate --no-cache --tries=10 -O payara-micro-server.jar https://repo1.maven.org/maven2/fish/payara/extras/payara-micro/$PAYARA_VERSION/payara-micro-$PAYARA_VERSION.jar

RUN echo "Download postgresql jdbc driver"
RUN wget --no-check-certificate --no-cache --tries=10 -O /home/runtime/lib/postgresql.jar https://repo1.maven.org/maven2/org/postgresql/postgresql/$POSTGRES_VERSION/postgresql-$POSTGRES_VERSION.jar

RUN echo "Download joynr-discovery"
RUN wget --no-check-certificate --no-cache --tries=10 -O discovery-directory.war https://repo1.maven.org/maven2/io/joynr/java/backend-services/discovery-directory-jee/$JOYNR_VERSION/discovery-directory-jee-$JOYNR_VERSION.war

COPY $BUILD_DIR/config/domain.xml ./domain.xml

ENTRYPOINT $JAVA_HOME/bin/java $JAVA_OPTIONS "-jar" $JAVA_APP_JAR $JAVA_ARGS