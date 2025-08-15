FROM quay.io/r0x0d/toolbox-base:latest@sha256:d63b4e8567528a966a03e6eac4b0e2e2bd574b9a68012b236e52bad08988f221

COPY hack/setup.sh /tmp/setup.sh

ENV PKGS ruby \
    ruby-devel \
    rvm 

RUN /tmp/setup.sh