FROM debian:buster-slim

RUN apt-get update && \
        apt-get upgrade -y && \
        apt-get install -y wget python3-pip golang unzip git && \
        wget https://releases.hashicorp.com/terraform/0.12.5/terraform_0.12.5_linux_amd64.zip && \
        unzip terraform_0.12.5_linux_amd64.zip -d /usr/bin && \
        pip3 install awscli && \
        wget https://get.helm.sh/helm-v2.14.0-linux-amd64.tar.gz && \
        tar xvf helm-v2.14.0-linux-amd64.tar.gz -C /usr/bin --strip 1 && \
        wget https://storage.googleapis.com/kubernetes-release/release/v1.15.0/bin/linux/amd64/kubectl && \
        install -m 755 kubectl /usr/bin


# Docker
RUN apt-get install -y apt-transport-https ca-certificates curl gnupg2 software-properties-common && \
        curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - && \
        add-apt-repository \
        "deb [arch=amd64] https://download.docker.com/linux/debian \
        $(lsb_release -cs) \
        stable" && \
        apt-get update && \
        apt-get install -y docker-ce docker-ce-cli containerd.io

# Latex
RUN apt-get install -y texlive texlive-base texlive-fonts-recommended texlive-fonts-extra
