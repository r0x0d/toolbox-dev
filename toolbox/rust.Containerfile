FROM quay.io/toolbox-dev/base:latest

COPY hack/setup.sh /tmp/setup.sh

ENV PKGS rust \
    cargo \
    rust-src

RUN /tmp/setup.sh
