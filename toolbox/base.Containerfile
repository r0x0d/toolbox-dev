FROM registry.fedoraproject.org/fedora-toolbox:43@sha256:d16bdacc5f22bef3b5337afa6ac1827ce0865a16b3c0a3630b004eed9bd4cba4

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
    gcc \
    gh \
    ImageMagick \
    graphviz \
    pandoc \
    ShellCheck \
    shfmt

# - Install common development tools
RUN <<EORUN
sed -i "s/enabled=1/enabled=0/" "/etc/yum.repos.d/fedora-cisco-openh264.repo"
echo "fastestmirror=true" >> /etc/dnf/dnf.conf
echo "max_parallel_downloads=20" >> /etc/dnf/dnf.conf
EORUN

RUN /tmp/setup.sh
