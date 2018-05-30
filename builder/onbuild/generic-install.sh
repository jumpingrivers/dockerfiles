#!/bin/sh
set -e

test -f install.d/apt.txt && {
    echo "Installing Debian packages..."

    apt-get update

    apt-get install -y "$(cat install.d/apt.txt)"

    rm -rf /var/lib/apt/lists/*
}

test -f install.d/tlmgr.txt && {
    echo "Installing TeX Live packages..."

    tlmgr install "$(cat install.d/tlmgr.txt)"
}

test -f install.d/Rpackages.txt && {
    echo "Installing R packages..."

    sudo -H -u trainer sh -c 'install2.r --deps TRUE --error -l /rpackages/ "$(cat install.d/Rpackages.txt)"'
}

test -f install.d/Rpackages-github.txt && {
    echo "Installing R packages from GitHub..."

    installGithub.r --deps TRUE "$(cat install.d/Rpackages-github.txt)"
}

