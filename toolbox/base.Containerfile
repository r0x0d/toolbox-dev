FROM registry.fedoraproject.org/fedora-toolbox:44@sha256:929e14e7a3914ed6c5b5277f2a9f64221a88f776c8032a2ae48e6155e220ef23

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

