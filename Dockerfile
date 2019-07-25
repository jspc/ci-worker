FROM debian:buster-slim

RUN apt-get update && \
        apt-get upgrade -y && \
        apt-get install -y wget python3-pip golang unzip && \
        wget https://releases.hashicorp.com/terraform/0.12.5/terraform_0.12.5_linux_amd64.zip && \
        unzip terraform_0.12.5_linux_amd64.zip -d /usr/bin && \
        pip3 install awscli
