FROM quay.io/r0x0d/toolbox-base:latest

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

ENV PKGS ShellCheck \
    python3-devel \
    python3-pip \
    shfmt \
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
