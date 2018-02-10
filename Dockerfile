FROM ubuntu:17.10
MAINTAINER Marvin Herman Froeder <velobr@gmail.com>

WORKDIR /workdir


RUN set -x && \
  apt-get update -y && \
  apt-get install openjdk-8-jdk -y

RUN set -x && \
  apt-get update -y && \
  apt-get install maven -y

CMD mvn