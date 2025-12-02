FROM quay.io/toolbox-dev/default:latest

COPY hack/setup.sh /tmp/setup.sh

ENV PKGS fedpkg \
    packit \
    copr-rpmbuild \
    copr \
    rust2rpm \
    go2rpm \
    cargo2rpm \
    pyp2spec \
    tomcli \
    rubygem-gem2rpm

RUN /tmp/setup.sh

LABEL purpose="A toolbox container for Fedora Packaging environment"
