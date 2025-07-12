FROM quay.io/r0x0d/toolbox-base:latest@sha256:01989a703a70703d428a5a004b1ae70e54880ec5630ca840fb78678e235a06b6

COPY hack/setup.sh /tmp/setup.sh

ENV PKGS ShellCheck \
    nodejs 

RUN /tmp/setup.sh

RUN <<EORUN
npm install --global yarn pnpm
EORUN
