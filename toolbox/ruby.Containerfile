FROM quay.io/r0x0d/toolbox-base:latest@sha256:3d653ca7509e01d7834b46226edf98faa9767f710b41b2fc59757506791e08de

COPY hack/setup.sh /tmp/setup.sh

ENV PKGS ruby \
    ruby-devel \
    rvm 

RUN /tmp/setup.sh