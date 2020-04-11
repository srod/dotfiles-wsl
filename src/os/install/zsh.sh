#!/bin/bash

main() {

    print_in_blue "\n   ZSH\n\n"

    sudo apt install -y zsh
    chsh -s $(which zsh)

}

main
