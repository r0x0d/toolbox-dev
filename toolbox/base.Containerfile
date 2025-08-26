FROM registry.fedoraproject.org/fedora-toolbox:42@sha256:8c3221eef15f766b625049bd2e64cf39e96780e6bdb37e4a77ff660136c86d1e

ARG CHOWN_ID=1000:1000

COPY --chown=${CHOWN_ID} hack/setup.sh /tmp/setup.sh
COPY --chown=${CHOWN_ID} hack/host-runner.sh /usr/local/bin/host-runner

ENV BINS rpm-ostree flatpak systemctl podman xdg-open

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
    g++ \
    pre-commit \
    gcc \
    btop

# - Install common development tools
RUN <<EORUN
sed -i "s/enabled=1/enabled=0/" "/etc/yum.repos.d/fedora-cisco-openh264.repo"
echo "fastestmirror=true" >> /etc/dnf/dnf.conf
echo "max_parallel_downloads=20" >> /etc/dnf/dnf.conf
EORUN

# Symlink host-runner to each package defined in $BINS environment variable
RUN <<EORUN
set -euxo pipefail
bins=($BINS)
for f in "${bins[@]}"; do
    ln -s host-runner /usr/local/bin/$f;
done
EORUN

RUN /tmp/setup.sh
