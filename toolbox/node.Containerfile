FROM quay.io/toolbox-dev/default:latest

COPY hack/setup.sh /tmp/setup.sh

ENV PKGS ShellCheck \
    nodejs \
    yarnpkg \
    pnpm

RUN /tmp/setup.sh