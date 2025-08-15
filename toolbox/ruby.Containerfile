FROM quay.io/r0x0d/toolbox-base:latest@sha256:cf7b394dfa24f8e0c88669ba3f16b6605eaf89c5cd6f2218b4c0ee7269eee036

COPY hack/setup.sh /tmp/setup.sh

ENV PKGS ruby \
    ruby-devel \
    rvm 

RUN /tmp/setup.sh