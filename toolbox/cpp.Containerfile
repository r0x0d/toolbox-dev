FROM quay.io/toolbox-dev/base:latest

COPY hack/setup.sh /tmp/setup.sh

ENV PKGS g++ \
         gcc \
         gcc-c++ \
         ctags \
         cmake

RUN /tmp/setup.sh
