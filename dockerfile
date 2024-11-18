FROM ubuntu
MAINTAINER venkat

RUN apt-get update
RUN apt-get install -y git
RUN apt-get install -y tree
RUN apt-get install -y maven
