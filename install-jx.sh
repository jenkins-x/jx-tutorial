#!/bin/bash

JX_VERSION=1.3.694

function install_dependencies() {
    wget -q https://github.com/jenkins-x/jx/releases/download/v${JX_VERSION}/jx-linux-amd64.tar.gz
    tar xvf jx-linux-amd64.tar.gz >/dev/null 2>&1
    rm jx-linux-amd64.tar.gz >/dev/null 2>&1
    mkdir -p ~/bin
    mv jx ~/bin
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