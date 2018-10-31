FROM alpine:latest
RUN apk update --no-cache
RUN apk add python py-pip curl --no-cache
RUN pip install awscli && \
            apk del --purge -v py-pip && \
            curl https://releases.hashicorp.com/terraform/0.11.10/terraform_0.11.10_linux_amd64.zip  -o terraform.zip && \
            unzip terraform.zip -d /usr/local/bin && \
            rm -rf terraform.zip && \
            apk del --purge -v curl

CMD "/bin/sh"
