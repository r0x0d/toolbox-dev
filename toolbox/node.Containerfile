FROM quay.io/r0x0d/toolbox-base:latest

COPY hack/setup.sh /tmp/setup.sh

ENV PKGS ShellCheck \
    nodejs \
    shfmt

RUN /tmp/setup.sh

RUN <<EORUN
npm install --global yarn
EORUN
