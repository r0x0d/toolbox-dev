FROM registry.fedoraproject.org/fedora-toolbox:42@sha256:11f8555cc8bf72187ee5c4c5875689c9c35eefef8ca2b85d3d9d7a2d52f71613

COPY hack/setup.sh /tmp/setup.sh
ENV PKGS asciinema \
    fd-find \
    fzf \
    git-credential-libsecret \
    inotify-tools \
    jq \
    make \
    bat \
    mkpasswd \
    ripgrep \
    vim \
    openssl-devel \
    neovim \
    g++ \
    gcc
    
# - Install common development tools
RUN <<EORUN
sed -i "s/enabled=1/enabled=0/" "/etc/yum.repos.d/fedora-cisco-openh264.repo"
echo "fastestmirror=true" >> /etc/dnf/dnf.conf
echo "max_parallel_downloads=20" >> /etc/dnf/dnf.conf
EORUN

RUN /tmp/setup.sh

