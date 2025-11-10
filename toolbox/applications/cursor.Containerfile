FROM quay.io/toolbox-dev/default:latest

COPY hack/setup.sh /tmp/setup.sh

RUN CURSOR_RPM_URL=$(curl -sL https://cursor.com/downloads \
  | grep -oE 'https://api2\.cursor\.sh/updates/download/[^"]+' \
  | grep 'linux-x64-rpm' \
  | uniq \
  | sort -V \
  | tail -1) && \
    export PKGS="$CURSOR_RPM_URL" && \
    /tmp/setup.sh

LABEL purpose="A toolbox container for Cursor application"
