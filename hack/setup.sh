#!/usr/bin/env bash
set -euxo pipefail

DNF_BASE_OPTS="-y --nodocs --setopt=keepcache=0 --setopt=tsflags=nodocs"
PKGS="${PKGS:-()}"

dnf -y update && dnf install $DNF_BASE_OPTS $PKGS && dnf clean all