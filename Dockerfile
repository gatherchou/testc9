FROM keymetrics/pm2:latest-alpine

RUN apk update
RUN apk add --no-cache g++ make python tmux curl bash git
RUN wget -O - https://raw.githubusercontent.com/c9/install/master/install.sh | bash
# RUN apk add --no-cache build-base g++ make curl wget openssl-dev apache2-utils git libxml2-dev sshfs nodejs bash python python-dev py-pip
RUN git clone https://github.com/c9/core.git cloud9
RUN /cloud9/scripts/install-sdk.sh
RUN sed -i 's|127.0.0.1|0.0.0.0|g' /cloud9/configs/standalone.js

