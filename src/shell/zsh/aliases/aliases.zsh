# Command upgrades
alias ll="ls -alh"
alias ln="ln -v"
alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"
alias vi="/usr/bin/vim"
alias pbcopy="xclip -selection clipboard"
alias pbpaste="xclip -selection clipboard -o"

# Navigation
alias dotfiles="cd $DOTFILES"

# Maintenance
alias lsdu="du -csh $(pwd)"
alias check-space="du -h ~/ | grep '^[0-9]*.[0-9]G'"
alias sizedir="du -sh */ | sort -h"
alias pid="ps x | grep -i $1"
alias grep="grep --color=auto"
alias aliases="subl $DOTFILES/src/shell/zsh/aliases/aliases.zsh"

# Update
alias aptup="sudo apt-get update; sudo apt-get upgrade;"
alias npmup="npm -g update; npm install -g npm"
alias update="aptup; npmup"

# Network
alias network.ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias network.ips="ifconfig -a | grep -o 'inet6\? \(\([0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+\)\|[a-fA-F0-9:]\+\)' | sed -e 's/inet6* //'"
alias network.speedtest="curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python - --server 24215"

# Utils
alias clean.ds_store="find . -type f -name '*.DS_Store' -ls -delete"
alias clean.node="rm -rf node_modules"
alias clean.npm="clean.node && npm cache verify && npm install"
alias clean.yarn="clean.node && yarn"
alias json="python -mjson.tool"
