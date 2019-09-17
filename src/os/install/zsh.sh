#!/bin/bash

main() {

    print_in_blue "\n   ZSH\n\n"

    sudo pacman -S zsh
    sudo usermod -s /usr/bin/zsh $(whoami)

}

main
