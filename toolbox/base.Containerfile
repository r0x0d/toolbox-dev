FROM registry.fedoraproject.org/fedora-toolbox:42@sha256:4d1716aabce515445415ef0a2f2735928cde95b97d63a8b0c665eedf7530a59d

ARG CHOWN_ID=1000:1000

COPY --chown=${CHOWN_ID} hack/setup.sh /tmp/setup.sh
COPY --chown=${CHOWN_ID} hack/host-runner.sh /usr/local/bin/host-runner
COPY etc etc

ENV BINS rpm-ostree flatpak systemctl podman xdg-open firefox

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
    lua lua5.1 \
    g++ \
    pre-commit \
    code \
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
