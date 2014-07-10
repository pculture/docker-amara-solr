FROM ubuntu:14.04
MAINTAINER Amara "http://amara.org"
RUN apt-get update
RUN RUNLEVEL=1 DEBIAN_FRONTEND=noninteractive apt-get install -y wget openjdk-7-jre-headless git-core unzip
RUN wget https://s3.amazonaws.com/amara/support/apache-solr-3.6.2.tgz --no-check-certificate -O /tmp/solr.tar.gz
RUN (cd /tmp && tar zxf solr.tar.gz && mv apache-solr-* /opt/solr)
RUN wget https://raw.github.com/pculture/unisubs/staging/schema.xml -O /opt/solr/example/solr/conf/schema.xml

EXPOSE 8983
WORKDIR /opt/solr/example
CMD ["java", "-jar", "start.jar"]
