FROM registry.fedoraproject.org/fedora-toolbox:43

ARG CHOWN_ID=1000:1000

COPY --chown=${CHOWN_ID} hack/setup.sh /tmp/setup.sh
COPY --chown=${CHOWN_ID} hack/symlink-host-runner.sh /tmp/symlink-host-runner.sh
COPY --chown=${CHOWN_ID} hack/host-runner.sh /usr/local/bin/host-runner

ENV BINS rpm-ostree flatpak systemctl podman xdg-open bootc firefox gh skopeo

# - Install common development tools
ENV PKGS asciinema \
    fd-find \
    shfmt \
    fzf \
    git-credential-libsecret \
    fish \
    jq \
    make \
    ripgrep \
    vim-X11 \
    neovim \
    openssl-devel \
    g++ \
    gcc \
    rpm-spec-language-server \
    nodejs-bash-language-server \
    git-lfs

RUN sed -i "s/enabled=1/enabled=0/" "/etc/yum.repos.d/fedora-cisco-openh264.repo" \
    && echo "fastestmirror=true" >> /etc/dnf/dnf.conf \
    && echo "max_parallel_downloads=20" >> /etc/dnf/dnf.conf

# Symlink host-runner to each package defined in $BINS environment variable
RUN /tmp/symlink-host-runner.sh

RUN /tmp/setup.sh

# Docker language server
RUN curl -s https://api.github.com/repos/docker/docker-language-server/releases/latest \
    | grep "browser_download_url.*linux-amd64" \
    | cut -d '"' -f 4 \
    | xargs -I {} sh -c 'curl -L {} -o /usr/local/bin/docker-language-server' \
    && chmod u+x /usr/local/bin/docker-language-server \
    && chown ${CHOWN_ID} /usr/local/bin/docker-language-server

RUN npm i -g vscode-langservers-extracted yaml-language-server @johnnymorganz/stylua-bin

LABEL purpose="General toolbox for personal use"
