FROM quay.io/r0x0d/toolbox-base:latest@sha256:5857cd91560c890c4a8db63eaab29d3ed7c50052541cc619bd11fa2502a9f6c9

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

RUN /tmp/setup.sh

RUN <<EORUN
# Install packages using pip
pip install --no-cache-dir ruff pyright pre-commit

# Install UV
curl -LsSf https://astral.sh/uv/install.sh | sh

# Install poetry
curl -sSL https://install.python-poetry.org | python3 -
EORUN
