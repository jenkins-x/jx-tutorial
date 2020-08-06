#!/bin/bash

JX_VERSION=2.1.127

function install_dependencies() {
    mkdir -p ~/bin
    echo "Downloading & installing Jenkins X ${JX_VERSION}"
    curl -sL https://github.com/jenkins-x/jx/releases/download/v${JX_VERSION}/jx-linux-amd64.tar.gz \
    | tar xvz -C ~/bin
    echo "Installed"
}

function add_path_to_bashrc() {
    if grep -q PATH ~/.bashrc; then
        echo "Already on path"
    else
        echo "export PATH=$PATH:$HOME/bin:$HOME/.jx/bin" >> ~/.bashrc
        export PATH=$PATH:$HOME/bin:$HOME/.jx/bin
        jx --help
    fi
}

install_dependencies
add_path_to_bashrc