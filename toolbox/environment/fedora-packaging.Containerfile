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
RUN python3 -m pip install --no-cache-dir \
    woolly==0.4.0 \
    fuzzytail==0.1.0 \
    cookiecutter==2.6.0 \
    # Needed for cookiecutter
    jinja2_time==0.2.0

LABEL purpose="A toolbox container for Fedora Packaging environment"
