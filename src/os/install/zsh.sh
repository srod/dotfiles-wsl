#!/bin/bash

main() {

    print_in_blue "\n   ZSH\n\n"

    sudo dnf install -y zsh util-linux-user
    chsh -s $(which zsh)

}

main
