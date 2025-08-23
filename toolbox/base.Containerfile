FROM registry.fedoraproject.org/fedora-toolbox:42@sha256:1bd000ce48a1d4f05b6c12f54ba0d5b50ba00c78afe6a79409ece049be18bde9

ARG CHOWN_ID=1000:1000

COPY --chown=${CHOWN_ID} hack/setup.sh /tmp/setup.sh
COPY --chown=${CHOWN_ID} hack/host-runner.sh /usr/local/bin/host-runner

ENV BINS rpm-ostree flatpak systemctl podman xdg-open

ENV PKGS asciinema \
    fd-find \
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
    gcc \
    btop

# - Install common development tools
RUN <<EORUN
sed -i "s/enabled=1/enabled=0/" "/etc/yum.repos.d/fedora-cisco-openh264.repo"
echo "fastestmirror=true" >> /etc/dnf/dnf.conf
echo "max_parallel_downloads=20" >> /etc/dnf/dnf.conf
EORUN

RUN <<EORUN
set -euxo pipefail
bins=($BINS)
for f in "${bins[@]}"; do
    ln -s host-runner /usr/local/bin/$f;
done
EORUN

RUN /tmp/setup.sh

