FROM registry.fedoraproject.org/fedora-toolbox:44

ENV HOME /root
ENV container container

RUN sed -i "s/enabled=1/enabled=0/" "/etc/yum.repos.d/fedora-cisco-openh264.repo" \
    && echo "fastestmirror=true" >> /etc/dnf/dnf.conf \
    && echo "max_parallel_downloads=20" >> /etc/dnf/dnf.conf

COPY ansible/ /usr/share/toolbox-dev/ansible/
COPY ansible/defaults.yml /usr/share/toolbox-dev/defaults.yml

COPY bin/tdx-apply /usr/local/bin/tdx-apply
COPY bin/tdx-edit /usr/local/bin/tdx-edit
COPY bin/tdx-upgrade /usr/local/bin/tdx-upgrade

COPY hack/profile.d/tdx.sh /etc/profile.d/tdx.sh

RUN dnf install -y --nodocs ansible-core jq podman-remote python3-pip systemd \
    && dnf clean all

# Workaround for apple container. See https://github.com/apple/container/issues/1669
RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == \
systemd-tmpfiles-setup.service ] || rm -f $i; done); \
rm -f /lib/systemd/system/multi-user.target.wants/*;\
rm -f /etc/systemd/system/*.wants/*;\
rm -f /lib/systemd/system/local-fs.target.wants/*; \
rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
rm -f /lib/systemd/system/basic.target.wants/*;\
rm -f /lib/systemd/system/anaconda.target.wants/*;

RUN HOME=/root ansible-galaxy collection install community.general

VOLUME [ "/sys/fs/cgroup" ]
CMD ["/usr/sbin/init"]

LABEL purpose="Development toolbox with configurable language environments"
