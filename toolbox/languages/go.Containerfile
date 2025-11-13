FROM quay.io/toolbox-dev/default:latest

COPY hack/setup.sh /tmp/setup.sh

ENV PKGS go

RUN /tmp/setup.sh

LABEL purpose="General toolbox for go development"

