#!/usr/bin/env bash
# This code was generated by the devconainer-contrib cli 
# For more information: https://github.com/devcontainers-contrib/cli 

set -e

ensure_curl () {
    if ! type curl >/dev/null 2>&1; then
        apt-get update -y && apt-get -y install --no-install-recommends curl
    fi 
}



ensure_featmake () {
    if ! type featmake > /dev/null 2>&1; then
        temp_dir=/tmp/featmake-download
        mkdir -p $temp_dir

        curl -sSL -o $temp_dir/featmake https://github.com/devcontainers-contrib/cli/releases/download/v0.0.9/featmake 
        curl -sSL -o $temp_dir/checksums.txt https://github.com/devcontainers-contrib/cli/releases/download/v0.0.9/checksums.txt

        (cd $temp_dir ; sha256sum --check --strict $temp_dir/checksums.txt)

        chmod a+x $temp_dir/featmake
        mv -f $temp_dir/featmake /usr/local/bin/featmake

        rm -rf $temp_dir
    fi
}

ensure_curl

ensure_featmake

# installing ghcr.io/devcontainers-contrib/features/apt-get-packages:1.0.0
PACKAGES="tmux" featmake "ghcr.io/devcontainers-contrib/features/apt-get-packages:1.0.0"

