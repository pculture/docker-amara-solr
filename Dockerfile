FROM ubuntu:12.04
MAINTAINER Amara "http://amara.org"
RUN (echo "deb http://archive.ubuntu.com/ubuntu precise main universe multiverse" > /etc/apt/sources.list)
RUN (echo "deb-src http://archive.ubuntu.com/ubuntu precise main universe multiverse" >> /etc/apt/sources.list)
RUN apt-get -qq update
RUN DEBIAN_FRONTEND=noninteractive apt-get -y upgrade
RUN RUNLEVEL=1 DEBIAN_FRONTEND=noninteractive apt-get install -y wget openjdk-6-jre-headless
RUN wget https://s3.amazonaws.com/amara/support/apache-solr-3.6.2.tgz --no-check-certificate -O /tmp/solr.tar.gz
RUN (cd /tmp && tar zxf solr.tar.gz && mv apache-solr-* /opt/solr)
RUN wget https://raw.github.com/pculture/unisubs/staging/schema.xml /opt/solr/example/solr/conf/schema.xml

EXPOSE 8983
WORKDIR /opt/solr/example
CMD ["java", "-jar", "start.jar"]
