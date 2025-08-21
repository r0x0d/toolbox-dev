FROM quay.io/r0x0d/toolbox-base:latest@sha256:2f8581a39af132e4d61186839d53fb7a648e71b4ab91ba3d7f9a5edd7fbec713

COPY hack/setup.sh /tmp/setup.sh

ENV PKGS dotnet-sdk-9.0 \
    dotnet-runtime-9.0 \
    libicu

RUN /tmp/setup.sh
