FROM quay.io/r0x0d/toolbox-base:latest@sha256:2f8581a39af132e4d61186839d53fb7a648e71b4ab91ba3d7f9a5edd7fbec713

COPY hack/setup.sh /tmp/setup.sh

ENV PKGS ShellCheck \
    nodejs 

RUN /tmp/setup.sh

RUN <<EORUN
npm install --global yarn pnpm
EORUN
