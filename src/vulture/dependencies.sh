#!/usr/bin/env bash
# This code was generated by the devconainer-contrib cli 
# For more information: https://github.com/devcontainers-contrib/cli 

set -e

ensure_curl () {
    if ! type curl >/dev/null 2>&1; then
        apt-get update -y && apt-get -y install --no-install-recommends curl
    fi 
}

ensure_curl

PACKAGE="vulture" source <(curl -s "https://raw.githubusercontent.com/devcontainers-contrib/cli/main/resources/install-feature.sh") "ghcr.io/devcontainers-contrib/features/pipx-package:1.0.1"
