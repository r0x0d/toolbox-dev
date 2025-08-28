FROM quay.io/toolbox-dev/base:latest

COPY hack/setup.sh /tmp/setup.sh

ENV PKGS rust \
    cargo

RUN /tmp/setup.sh
