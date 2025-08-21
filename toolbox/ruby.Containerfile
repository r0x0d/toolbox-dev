FROM quay.io/r0x0d/toolbox-base:latest

COPY hack/setup.sh /tmp/setup.sh

ENV PKGS ruby \
    ruby-devel \
    rvm 

RUN /tmp/setup.sh
