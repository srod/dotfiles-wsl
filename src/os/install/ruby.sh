#!/bin/bash

#declare -r LOCAL_SHELL_CONFIG_FILE="$HOME/.bash.local"
declare -r RUBY_VERSION="2.5.5"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

add_rbenv_configs() {

    declare -r CONFIGS="
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    execute \
        "printf '%s' '$CONFIGS' >> $LOCAL_SHELL_CONFIG_FILE \
            && . $LOCAL_SHELL_CONFIG_FILE" \
        "rbenv (update $LOCAL_SHELL_CONFIG_FILE)"

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

install_ruby() {

    execute "sudo apt update" "Update system"
    execute "sudo apt install -y git curl libssl-dev libreadline-dev zlib1g-dev autoconf bison build-essential libyaml-dev libreadline-dev libncurses5-dev libffi-dev libgdbm-dev" "Install dependencies"
    execute "curl -sL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-installer | bash -" "Install rbenc"

    add_rbenv_configs()

    execute "rbenv install '$RUBY_VERSION'" "Install"
    execute "rbenv global '$RUBY_VERSION'" "Set global '$RUBY_VERSION'"
    # execute ". $LOCAL_SHELL_CONFIG_FILE" "Load env"
    execute "gem update --system" "Update system"
    execute "gem update" "Update"

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_blue "\n   Ruby\n\n"

    install_ruby

}

main
