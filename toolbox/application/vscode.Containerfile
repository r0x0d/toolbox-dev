FROM quay.io/toolbox-dev/base:latest

COPY etc etc

COPY hack/setup.sh /tmp/setup.sh

ENV PKGS code

RUN /tmp/setup.sh
