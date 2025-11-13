FROM quay.io/toolbox-dev/default:latest

COPY hack/setup.sh /tmp/setup.sh

ENV PKGS ruby \
    ruby-devel \
    rvm

RUN /tmp/setup.sh

RUN gem install ruby-lsp

LABEL purpose="General toolbox for ruby development"
