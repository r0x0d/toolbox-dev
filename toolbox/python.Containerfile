FROM quay.io/r0x0d/toolbox-base:latest@sha256:01989a703a70703d428a5a004b1ae70e54880ec5630ca840fb78678e235a06b6

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
