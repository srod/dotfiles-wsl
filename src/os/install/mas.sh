#!/bin/bash

is_app_store_logged() {
    eval "mas account" &> /dev/null
}

install_mas() {

    if cmd_exists "mas"; then

        if ! is_app_store_logged; then

            print_in_yellow "   You need to be logged in the App Store, please log-in\n\n"

            #ask "Please provide your login: "
            #local login=$(get_answer)
            #ask "Please provide your password: "
            #local password=$(get_answer)
            #execute "mas signin --dialog $login $password"

            open -a "App Store"
            execute \
                "until is_app_store_logged; do \
                    sleep 5; \
                done" \
                "Loggin..."
            printf "\n"

        fi

        execute "mas install 824183456"  "Affinity Photo"
        execute "mas install 681812329"  "iCompta"
        execute "mas install 409183694"  "Keynote"
        execute "mas install 409203825"  "Numbers"
        execute "mas install 409201541"  "Pages"
        execute "mas install 568494494"  "Pocket"
        execute "mas install 880001334"  "Reeder"
        execute "mas install 1153157709" "Speedtest"
        execute "mas install 557168941"  "Tweetbot"

    else
        print_result $? "MAS must be installed with homebrew"
    fi

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_blue "\n   Mac App Store\n\n"

    ask_for_confirmation "Do you want to install applications?"
    if answer_is_yes; then
        printf "\n"
        install_mas
    fi

}

main
