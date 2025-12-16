FROM quay.io/toolbox-dev/default:latest

COPY hack/setup.sh /tmp/setup.sh

ENV PKGS dotnet-sdk-10.0 \
    dotnet-runtime-01.0 \
    libicu

RUN /tmp/setup.sh

RUN dotnet tool install --global csharp-ls

LABEL purpose="General toolbox for dotnet development"
