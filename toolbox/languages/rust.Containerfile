FROM quay.io/toolbox-dev/default:latest

COPY hack/setup.sh /tmp/setup.sh

ENV PKGS rustup

RUN /tmp/setup.sh

RUN rustup-init -y

LABEL purpose="General toolbox for rust development"
