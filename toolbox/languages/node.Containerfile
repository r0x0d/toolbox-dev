FROM quay.io/toolbox-dev/default:latest

COPY hack/setup.sh /tmp/setup.sh

ENV PKGS nodejs

RUN /tmp/setup.sh

RUN npm install -g pnpm@latest yarn@latest

LABEL purpose="General toolbox for node development"
