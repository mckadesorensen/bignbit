FROM amazonlinux:2023 AS al2023
LABEL authors="dmsorensen"

ENV TERRAFORM_VERSION="1.9.2"

# Docker
RUN dnf install -y docker

# CLI tools
RUN dnf install -y zip
# Terraform
RUN \
        curl "https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip" -o "terraform.zip" && \
        unzip terraform.zip && \
        chmod +x terraform && \
        mv terraform /usr/local/bin

# Bypass the bootstrap.sh script that runs in lambda
ENTRYPOINT []
