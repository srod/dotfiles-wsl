#!/bin/bash

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

install_opam() {

    brew_install "Brew Opam" "opam"

    execute "opam init -a" "Init"

    execute \
        "printf '%s' '

# Patdiff
`opam config env`' >> $LOCAL_SHELL_CONFIG_FILE" "Setup env"

    execute ". $LOCAL_SHELL_CONFIG_FILE && \
             opam install patdiff --yes" \
             "Install Patdiff"

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_blue "\n   OPAM\n\n"

    install_opam

}

main
