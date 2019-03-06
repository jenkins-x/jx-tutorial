#!/bin/bash

JX_VERSION=1.3.960

function install_dependencies() {
    mkdir -p ~/bin
    curl -sL https://github.com/jenkins-x/jx/releases/download/v${JX_VERSION}/jx-linux-amd64.tar.gz \
    | tar xvz -C ~/bin
}

function add_path_to_bashrc() {
    if grep -q PATH ~/.bashrc; then
        echo ""
    else
        echo "export PATH=$PATH:$HOME/bin:$HOME/.jx/bin" >> ~/.bashrc
        echo "export PATH=$PATH:$HOME/bin:$HOME/.jx/bin"
    fi
}

install_dependencies
add_path_to_bashrc