FROM quay.io/toolbox-dev/default:latest

COPY hack/setup.sh /tmp/setup.sh

ENV PKGS g++ \
         gcc \
         gcc-c++ \
         ctags \
         clangd \
         cmake

RUN /tmp/setup.sh

LABEL purpose="General toolbox for cpp development"
