FROM quay.io/r0x0d/toolbox-base:latest@sha256:dd4d99f758f5990f563fe7a352c14b47655420cfd829b88ad85c4e1328a48759

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
