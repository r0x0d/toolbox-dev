FROM quay.io/toolbox-dev/default:latest

COPY hack/setup.sh /tmp/setup.sh

ENV PKGS ruby \
    ruby-devel \
    rvm 

RUN /tmp/setup.sh
