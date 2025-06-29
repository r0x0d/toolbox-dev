FROM quay.io/r0x0d/toolbox-base:latest

# - Install common development tools for python
RUN <<EORUN

dnf -y install \
    ShellCheck \
    ruff \
    g++ \
    gcc \
    pylint \
    pyright \
    python3-pip \
    python3-devel \
    pre-commit \
    shfmt \
    yamllint 
    
dnf clean all

curl -fsSL https://pyenv.run | bash
EORUN

ENV PATH "$HOME/.pyenv:$PATH"