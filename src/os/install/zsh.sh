#!/bin/bash

main() {

    print_in_blue "\n   ZSH\n\n"

    sudo apt install -y zsh
    sudo usermod -s /usr/bin/zsh $(whoami)

}

main
