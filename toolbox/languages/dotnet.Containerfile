FROM quay.io/toolbox-dev/default:latest

COPY hack/setup.sh /tmp/setup.sh

ENV PKGS dotnet-sdk-10.0 \
    dotnet-runtime-10.0 \
    libicu

RUN /tmp/setup.sh

LABEL purpose="General toolbox for dotnet development"
