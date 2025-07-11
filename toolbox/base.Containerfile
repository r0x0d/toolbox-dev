FROM registry.fedoraproject.org/fedora-toolbox:42@sha256:cbb11b08c82cf6fb609da9635bb0c3394b5b26f60d0f42970914892f6586a41a

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
