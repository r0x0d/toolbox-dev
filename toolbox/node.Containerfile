FROM quay.io/toolbox-dev/base:latest

COPY hack/setup.sh /tmp/setup.sh

ENV PKGS ShellCheck \
    nodejs 

RUN /tmp/setup.sh

RUN <<EORUN
npm install --global yarn pnpm
EORUN
