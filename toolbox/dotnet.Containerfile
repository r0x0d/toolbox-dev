FROM quay.io/r0x0d/toolbox-base:latest@sha256:5857cd91560c890c4a8db63eaab29d3ed7c50052541cc619bd11fa2502a9f6c9

COPY hack/setup.sh /tmp/setup.sh

ENV PKGS dotnet-sdk-9.0 \
    dotnet-runtime-9.0 \
    libicu

RUN /tmp/setup.sh
