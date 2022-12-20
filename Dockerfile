FROM ubuntu:22.04

ENV NVM_DIR $TMP_STORE/nvm
ENV NODE_VERSION 18.12.1

RUN apt-get update

RUN apt-get -y upgrade

RUN apt-get -y install curl

RUN apt-get -y install nano vim git wget

ENV NVM_DIR /root/.nvm
ENV NODE_VERSION lts/*
RUN mkdir $HOME/.nvm && \
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash && \
    chmod +x $HOME/.nvm/nvm.sh && \
    . $HOME/.nvm/nvm.sh && \
    nvm install --latest-npm "$NODE_VERSION" && \
    nvm alias default "$NODE_VERSION" && \
    nvm use default && \
    DEFAULT_NODE_VERSION=$(nvm version default) && \
    ln -sf /root/.nvm/versions/node/$DEFAULT_NODE_VERSION/bin/node /usr/bin/nodejs && \
    ln -sf /root/.nvm/versions/node/$DEFAULT_NODE_VERSION/bin/node /usr/bin/node && \
    ln -sf /root/.nvm/versions/node/$DEFAULT_NODE_VERSION/bin/npm /usr/bin/npm

RUN wget https://github.com/coder/code-server/releases/download/v4.9.0/code-server_4.9.0_amd64.deb

RUN dpkg -i code-server_4.9.0_amd64.deb


WORKDIR /project


# CMD code-server; echo "bind-addr: 127.0.0.1:8443 \
#   auth: password \
#   password: password \
#   cert: false" > ~/.config/code-server/config.yaml