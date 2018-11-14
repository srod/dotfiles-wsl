#!/bin/bash

install_java() {

    sdk install java

    print_result $? "SDK - Java"

}

install_sdk() {

    if ! cmd_exists "sdk"; then
        printf "\n" | curl -s "https://get.sdkman.io" | bash &> /dev/null
        #  └─ simulate the ENTER keypress
    fi

    source "$HOME/.sdkman/bin/sdkman-init.sh"

    print_result $? "SDK"

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_blue "\n   SDK\n\n"

    install_sdk
    install_java

}

main
