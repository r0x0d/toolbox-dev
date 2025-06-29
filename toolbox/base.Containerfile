FROM registry.fedoraproject.org/fedora-toolbox:42

# - Install common development tools
# - Install gh (GitHub) cli
# - Remove mlocate
RUN <<EORUN
set -euxo pipefail
sed -i "s/enabled=1/enabled=0/" "/etc/yum.repos.d/fedora-cisco-openh264.repo"
dnf -y update

dnf -y install \
    asciinema \
    fd-find \
    fzf \
    git-credential-libsecret \
    inotify-tools \
    jq \
    make \
    mkpasswd \
    ripgrep \
    vim \
    gh-cli

dnf -y install \
    ImageMagick \
    graphviz \
    pandoc \
    --exclude=adobe-source-code-pro-fonts,logrotate,low-memory-monitor,nodejs-docs,nodejs-full-i18n,pipewire,tracker,tracker-miners,upower,xdg-desktop-portal-gtk

dnf -y install \
    openssl-devel 
    
dnf clean all
EORUN

# Setup host-runner script and symlinks
COPY hack/host-runner /usr/local/bin/host-runner
RUN <<EORUN
set -euxo pipefail
bins=(
    "btop"
    "code"
    "firefox"
    "flatpak"
    "htop"
    "podman"
    "rpm-ostree"
    "systemctl"
    "xdg-open"
);
for f in "${bins[@]}"; do
    ln -s host-runner /usr/local/bin/$f;
done
EORUN