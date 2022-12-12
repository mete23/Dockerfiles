FROM ubuntu:22.04

RUN apt-get update

RUN apt-get -y upgrade

RUN apt-get -y install curl

RUN apt-get -y install nano vim git wget

#setting up code-server
RUN wget https://github.com/coder/code-server/releases/download/v4.9.0/code-server_4.9.0_amd64.deb
RUN dpkg -i code-server_4.9.0_amd64.deb




WORKDIR /project

#uncomment for automatic start
#CMD code-server --bind-addr 0.0.0.0:8443 .
