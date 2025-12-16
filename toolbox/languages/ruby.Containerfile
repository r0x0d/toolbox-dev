FROM quay.io/toolbox-dev/default:latest

COPY hack/setup.sh /tmp/setup.sh

ENV PKGS ruby \
    ruby-devel \
    rvm

RUN /tmp/setup.sh

RUN gem install ruby-lsp:0.26.4 \
    ruby-lsp-rails:0.4.8 \
    ruby-lsp-rspec:0.1.28 \
    ruby-lsp-rubyfmt:0.1.0 \
    ruby-lsp-rake:0.3.6

LABEL purpose="General toolbox for ruby development"
