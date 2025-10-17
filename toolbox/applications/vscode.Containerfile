FROM quay.io/toolbox-dev/default:latest

COPY etc etc

COPY hack/setup.sh /tmp/setup.sh

ENV PKGS code

RUN /tmp/setup.sh