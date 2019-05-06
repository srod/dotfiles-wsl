#!/bin/bash

declare -r LOCAL_SHELL_CONFIG_FILE="$HOME/.bash.local"
declare -r N_DIRECTORY="$HOME/.n"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

add_n_configs() {

    declare -r CONFIGS="
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# N
export N_PREFIX="$N_DIRECTORY"; [[ :$PATH: == *":$N_DIRECTORY/bin:"* ]] || PATH+=":$N_DIRECTORY/bin"
"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    execute \
        "printf '%s' '$CONFIGS' >> $LOCAL_SHELL_CONFIG_FILE \
            && . $LOCAL_SHELL_CONFIG_FILE" \
        "n (update $LOCAL_SHELL_CONFIG_FILE)"

}

install_node() {

    # Install the latest stable version of Node
    # (this will also set it as the default).

    execute \
        ". $LOCAL_SHELL_CONFIG_FILE \
            && n $1 \
            && npm install npm@6 -g" \
        "n (install Node $1)"
}

install_n() {

    # Install `n` and add the necessary
    # configs in the local shell config file.

    execute \
        "curl -L https://git.io/n-install | N_PREFIX=$N_DIRECTORY bash -s -- -y -n" \
        "n (install)" \
    && add_n_configs

}

update_n() {

    execute \
        "n-update" \
        "n (upgrade)"

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_blue "\n   N\n\n"

    if [ ! -d "$N_DIRECTORY" ]; then
        install_n
    else
        update_n
    fi

    install_node 6
    install_node 8
    install_node 10
    install_node 12

}

main
