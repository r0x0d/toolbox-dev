FROM quay.io/toolbox-dev/default:latest

COPY hack/setup.sh /tmp/setup.sh

RUN CURSOR_RPM_URL=$(curl -sL https://cursor.com/downloads | sed -n 's/.*\(https:\/\/downloads\.cursor\.com\/[^"]*\.rpm\).*/\1/p' | head -1) && \
    export PKGS="$CURSOR_RPM_URL" && \
    /tmp/setup.sh

LABEL purpose="A toolbox container for Cursor application"
