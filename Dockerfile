FROM debian:buster-slim

RUN apt-get update && \
        apt-get upgrade -y && \
        apt-get install -y wget python3-pip golang unzip git && \
        wget https://releases.hashicorp.com/terraform/0.12.18/terraform_0.12.18_linux_amd64.zip && \
        unzip terraform_0.12.18_linux_amd64.zip -d /usr/bin && \
        pip3 install awscli && \
        wget https://get.helm.sh/helm-v3.0.2-linux-amd64.tar.gz && \
        tar xvf helm-v3.0.2-linux-amd64.tar.gz -C /usr/bin --strip 1 && \
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
RUN apt-get install -y texlive texlive-base texlive-fonts-recommended texlive-fonts-extra texinfo

# glcoud cli
RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" > /etc/apt/sources.list.d/google-cloud-sdk.list && \
        curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key --keyring /usr/share/keyrings/cloud.google.gpg add - && \
        apt-get update && \
        apt-get install -y google-cloud-sdk

# rsync
RUN apt-get install -y rsync

# jq
RUN apt-get install -y jq
