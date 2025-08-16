FROM registry.fedoraproject.org/fedora-toolbox:42@sha256:e2da98a716fe6f3eca59baf5efe26b2fe3e30f1cc361654f1319978f7c10cbba

COPY hack/setup.sh /tmp/setup.sh
ENV PKGS asciinema \
    fd-find \
    fzf \
    git-credential-libsecret \
    inotify-tools \
    jq \
    make \
    mkpasswd \
    ripgrep \
    vim \
    openssl-devel \
    g++ \
    gcc
    
# - Install common development tools
RUN <<EORUN
sed -i "s/enabled=1/enabled=0/" "/etc/yum.repos.d/fedora-cisco-openh264.repo"
echo "fastestmirror=true" >> /etc/dnf/dnf.conf
echo "max_parallel_downloads=20" >> /etc/dnf/dnf.conf
EORUN

RUN /tmp/setup.sh

