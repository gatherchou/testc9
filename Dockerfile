FROM alpine:3.8

# ------------------------------------------------------------------------------
# Install base and Node
RUN apk add --update --no-cache g++ make python tmux curl bash git


# ------------------------------------------------------------------------------
# Install Cloud9
RUN git clone https://github.com/c9/core.git /cloud9 
RUN curl -s -L https://raw.githubusercontent.com/c9/install/master/link.sh | bash 
RUN /cloud9/scripts/install-sdk.sh 
RUN apk del g++ make 
RUN rm -rf /var/cache/apk/* /opt/cloud9/.git /tmp/* 
RUN npm cache clean

WORKDIR /cloud9


# Tweak standlone.js conf
RUN sed -i -e 's_127.0.0.1_0.0.0.0_g' /cloud9/configs/standalone.js 
