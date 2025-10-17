FROM registry.fedoraproject.org/fedora-toolbox:42

ARG CHOWN_ID=1000:1000

COPY --chown=${CHOWN_ID} hack/setup.sh /tmp/setup.sh
COPY --chown=${CHOWN_ID} hack/symlink-host-runner.sh /tmp/symlink-host-runner.sh
COPY --chown=${CHOWN_ID} hack/host-runner.sh /usr/local/bin/host-runner

ENV BINS rpm-ostree flatpak systemctl podman xdg-open bootc firefox gh

ENV PKGS asciinema \
    fd-find \
    shfmt \
    fzf \
    git-credential-libsecret \
    inotify-tools \
    jq \
    make \
    pre-commit \
    bat \
    mkpasswd \
    ripgrep \
    vim \
    openssl-devel \
    neovim \
    luarocks \
    lua \
    lua5.1 \
    g++ \
    pre-commit \
    gcc \
    btop \
    git-lfs

# - Install common development tools
RUN sed -i "s/enabled=1/enabled=0/" "/etc/yum.repos.d/fedora-cisco-openh264.repo" \
    && echo "fastestmirror=true" >> /etc/dnf/dnf.conf \
    && echo "max_parallel_downloads=20" >> /etc/dnf/dnf.conf 

# Symlink host-runner to each package defined in $BINS environment variable
RUN /tmp/symlink-host-runner.sh

RUN /tmp/setup.sh

LABEL purpose="General toolbox for personal use"