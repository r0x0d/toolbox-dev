#!/bin/bash

set -euxo pipefail
bins=($BINS)
for f in "${bins[@]}"; do
    ln -s host-runner /usr/local/bin/$f;
done