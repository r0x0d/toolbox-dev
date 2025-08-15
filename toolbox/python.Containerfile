FROM quay.io/r0x0d/toolbox-base:latest@sha256:d63b4e8567528a966a03e6eac4b0e2e2bd574b9a68012b236e52bad08988f221

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
