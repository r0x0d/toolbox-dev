FROM quay.io/toolbox-dev/default:latest

COPY hack/setup.sh /tmp/setup.sh

ENV PKGS rust \
    cargo \
    rustfmt \
    rust-src

RUN /tmp/setup.sh

LABEL purpose="General toolbox for rust development"