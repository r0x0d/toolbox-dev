FROM quay.io/r0x0d/toolbox-base:latest

COPY hack/setup.sh /tmp/setup.sh

ENV PKGS dotnet-sdk-9.0 \
    dotnet-runtime-9.0 \
    libicu

RUN /tmp/setup.sh
