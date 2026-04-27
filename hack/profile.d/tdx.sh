#!/usr/bin/env bash
# toolbox-dev: auto-apply configuration on container entry
TDX_CONFIG="${TDX_CONFIG:-$HOME/.config/toolbox-dev/config.yml}"
TDX_STAMP="$HOME/.config/toolbox-dev/.last-applied"

# Display the container name as the hostname in the shell prompt
if [ -f /run/.containerenv ]; then
    HOSTNAME=$(bash -c 'source /run/.containerenv 2>/dev/null && echo "$name"')
    HOSTNAME="${HOSTNAME:-tdx}"
    export HOSTNAME
fi

if [ -f "$TDX_CONFIG" ] && [ ! -f "$TDX_STAMP" ]; then
    echo "[toolbox-dev] First entry detected. Running tdx-apply..."
    tdx-apply
elif [ -f "$TDX_CONFIG" ] && [ "$TDX_CONFIG" -nt "$TDX_STAMP" ]; then
    echo "[toolbox-dev] Config changed since last apply. Running tdx-apply..."
    tdx-apply
fi
