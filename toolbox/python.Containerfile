FROM quay.io/r0x0d/toolbox-base:latest@sha256:e95c1f497d829701efd8c61790516ffe8b8ef1b74034fc2a6c2e855b92e57ada

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
    # dependencies for pyenv
    ${PYENV_PKGS}

ENV PYENV_ROOT "/opt/pyenv"

ENV PATH "${PYENV_ROOT}/bin:$PATH"

RUN /tmp/setup.sh

RUN <<EORUN
curl -fsSL https://pyenv.run | bash

# Install packages using pip
pip install --no-cache-dir ruff pyright pre-commit
EORUN
