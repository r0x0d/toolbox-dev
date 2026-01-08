FROM quay.io/toolbox-dev/default:latest

COPY hack/setup.sh /tmp/setup.sh

ENV PKGS fedpkg \
    packit \
    copr \
    copr-rpmbuild \
    # Packaging tools
    rust2rpm \
    go2rpm \
    cargo2rpm \
    pyp2spec \
    rubygem-gem2rpm \
    # Patch tools
    patch \
    tomcli \
    # Misc
    python3-pip

RUN /tmp/setup.sh

# Install nice-to-have tools for packaging
RUN python3 -m pip install --no-cache-dir \
    woolly==0.4.0 \
    fuzzytail==0.1.0 \
    cookiecutter==2.6.0 \
    # Needed for cookiecutter
    jinja2_time==0.2.0

LABEL purpose="A toolbox container for Fedora Packaging environment"
