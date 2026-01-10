FROM quay.io/toolbox-dev/default:latest

COPY hack/setup.sh /tmp/setup.sh

ENV PKGS zig

RUN /tmp/setup.sh

LABEL purpose="General toolbox for zig development"
