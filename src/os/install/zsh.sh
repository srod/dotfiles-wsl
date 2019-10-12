#!/bin/bash

main() {

    print_in_blue "\n   ZSH\n\n"

    package_install "ZSH" "zsh"
    execute "sudo usermod -s /usr/bin/zsh $(whoami)" "Change default shell"

}

main
