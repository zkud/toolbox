FROM toolbox-nvim-base

RUN apk add nodejs npm

# See https://sapmachine.io/docs/installation for more details
# Fetch the public key for repository verification
RUN wget -qO /etc/apk/keys/sapmachine-apk.rsa.pub https://dist.sapmachine.io/alpine/sapmachine-apk.rsa.pub
# Add the SapMachine repository to the system's repositories file
RUN echo "https://dist.sapmachine.io/alpine" >> /etc/apk/repositories
RUN apk add sapmachine-21-jdk

