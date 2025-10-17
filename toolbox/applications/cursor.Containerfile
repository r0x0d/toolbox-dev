FROM quay.io/toolbox-dev/default:latest

COPY hack/setup.sh /tmp/setup.sh

ENV PKGS https://downloads.cursor.com/production/b9e5948c1ad20443a5cecba6b84a3c9b99d62582/linux/x64/rpm/x86_64/cursor-1.7.46.el8.x86_64.rpm

RUN /tmp/setup.sh