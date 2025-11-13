FROM quay.io/toolbox-dev/default:latest

COPY hack/setup.sh /tmp/setup.sh

ENV PKGS go

RUN /tmp/setup.sh

RUN go install golang.org/x/tools/gopls@latest

LABEL purpose="General toolbox for go development"
