#!/bin/bash

create_symlinks() {

    declare -a FILES_TO_SYMLINK=(

        "shell/hyper.js"
        "shell/slate"
        "shell/zshrc"

        "git/gitconfig"
        "git/gitignore"

        "vim/vim"
        "vim/vimrc"

    )

    local i=""
    local sourceFile=""
    local targetFile=""

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    for i in "${FILES_TO_SYMLINK[@]}"; do

        sourceFile="$(cd .. && pwd)/$i"
        targetFile="$HOME/.$(printf "%s" "$i" | sed "s/.*\/\(.*\)/\1/g")"

        do_symlink "$sourceFile" "$targetFile"

    done

}

create_symlink_sublime_text() {

    sourceFile=$HOME/Dropbox/Applications/Sublime
    targetFile=$HOME/Library/Application\ Support/Sublime\ Text\ 3

    do_symlink "$sourceFile" "$targetFile"

}

do_symlink() {

    local sourceFile="$1"
    local targetFile="$2"
    local skipQuestions=false

    if [ ! -e "$targetFile" ] || $skipQuestions; then

        execute \
            "ln -fs '$sourceFile' '$targetFile'" \
            "$targetFile → $sourceFile"

    elif [ "$(readlink "$targetFile")" == "$sourceFile" ]; then
        print_success "$targetFile → $sourceFile"
    else

        if ! $skipQuestions; then

            ask_for_confirmation "'$targetFile' already exists, do you want to overwrite it?"
            if answer_is_yes; then

                rm -rf "$targetFile"

                execute \
                    "ln -fs '$sourceFile' '$targetFile'" \
                    "$targetFile → $sourceFile"

            else
                print_error "$targetFile → $sourceFile"
            fi

        fi

    fi

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_blue "\n • Create symbolic links\n\n"

    create_symlinks

    create_symlink_sublime_text

}

main
