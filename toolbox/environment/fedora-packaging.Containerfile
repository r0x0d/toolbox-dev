FROM quay.io/toolbox-dev/default:latest

COPY hack/setup.sh /tmp/setup.sh

ENV PKGS fedpkg packit copr-rpmbuild

RUN /tmp/setup.sh

LABEL purpose="A toolbox container for Fedora Packaging environment"
