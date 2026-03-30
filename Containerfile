FROM registry.fedoraproject.org/fedora-toolbox:44

RUN sed -i "s/enabled=1/enabled=0/" "/etc/yum.repos.d/fedora-cisco-openh264.repo" \
    && echo "fastestmirror=true" >> /etc/dnf/dnf.conf \
    && echo "max_parallel_downloads=20" >> /etc/dnf/dnf.conf

RUN dnf install -y --nodocs ansible-core jq podman-remote python3-pip \
    && dnf clean all

RUN HOME=/root ansible-galaxy collection install community.general

COPY ansible/ /usr/share/toolbox-dev/ansible/
COPY ansible/defaults.yml /usr/share/toolbox-dev/defaults.yml

COPY bin/tdx-apply /usr/local/bin/tdx-apply
COPY bin/tdx-edit /usr/local/bin/tdx-edit
COPY bin/tdx-upgrade /usr/local/bin/tdx-upgrade

COPY hack/profile.d/tdx.sh /etc/profile.d/tdx.sh

LABEL purpose="Development toolbox with configurable language environments"
