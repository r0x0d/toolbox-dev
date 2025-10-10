FROM quay.io/toolbox-dev/default:latest

COPY hack/setup.sh /tmp/setup.sh

ENV PYENV_PKGS patch \
    zlib-devel \
    bzip2 \
    bzip2-devel \
    readline-devel \
    sqlite \
    sqlite-devel \
    tk-devel \
    libffi-devel \
    xz-devel \
    libuuid-devel \
    gdbm-libs \
    libnsl2

ENV PKGS python3-devel \
    python3-pip \
    yamllint \
    ruff \
    # dependencies for pyenv
    ${PYENV_PKGS}

RUN /tmp/setup.sh

RUN pip install --no-cache-dir pyright