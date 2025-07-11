FROM quay.io/r0x0d/toolbox-base:latest@sha256:dd4d99f758f5990f563fe7a352c14b47655420cfd829b88ad85c4e1328a48759

COPY hack/setup.sh /tmp/setup.sh

ENV PKGS ruby \
    ruby-devel \
    rvm 

RUN /tmp/setup.sh