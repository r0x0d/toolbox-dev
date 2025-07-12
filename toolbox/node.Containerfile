FROM quay.io/r0x0d/toolbox-base:latest@sha256:e95c1f497d829701efd8c61790516ffe8b8ef1b74034fc2a6c2e855b92e57ada

COPY hack/setup.sh /tmp/setup.sh

ENV PKGS ShellCheck \
    nodejs 

RUN /tmp/setup.sh

RUN <<EORUN
npm install --global yarn pnpm
EORUN
