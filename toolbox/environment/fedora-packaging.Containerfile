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
    python3-pip \
    rubygem-gem2rpm

RUN /tmp/setup.sh

# Install nice-to-have tools for packaging
RUN python3 -m pip install \
    woolly \
    fuzzytail \
    cookiecutter \
    # Needed for cookiecutter
    jinja2_time

LABEL purpose="A toolbox container for Fedora Packaging environment"
