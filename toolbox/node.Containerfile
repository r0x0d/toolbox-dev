FROM quay.io/toolbox-dev/base:latest

COPY hack/setup.sh /tmp/setup.sh

ENV PKGS ShellCheck \
    nodejs \
    yarnpkg \
    pnpm

RUN /tmp/setup.sh