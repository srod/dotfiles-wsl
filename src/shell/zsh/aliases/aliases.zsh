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

# Work
alias root_rod="/mnt/c/Users/rodol/Insync/rodolphe.stoclin@outlook.fr/OneDrive"
alias work="cd $root_rod/www"
alias work.2clics="cd $root_rod/www/www.2clics.net"
alias work.minify="cd $root_rod/www/minify.2clics.net"
alias work.node-minify="cd $root_rod/www/github/node-minify"
alias work.node-version="cd $root_rod/www/github/node-version"

# Network
alias network.ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias network.ips="ifconfig -a | grep -o 'inet6\? \(\([0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+\)\|[a-fA-F0-9:]\+\)' | sed -e 's/inet6* //'"
alias network.speedtest="curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python - --server 24215"

# Flush Directory Service cache
alias network.flush="sudo nscd -K && sudo nscd && sudo systemd-resolve --flush-caches && echo 'DNS flushed'"

# View HTTP traffic
alias network.sniff="sudo ngrep -d 'wlo1' -t '^(GET|POST) ' 'tcp and port 80'"
alias network.httpdump="sudo tcpdump -i wlo1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# SSH
alias connect.usg="ssh 192.168.1.1"
alias connect.key="ssh 192.168.1.2"
alias connect.nas="ssh 192.168.1.6"
alias connect.pi="ssh pi@192.168.1.9"

# Utils
alias clean.ds_store="find . -type f -name '*.DS_Store' -ls -delete"
alias clean.node="rm -rf node_modules"
alias clean.npm="clean.node && npm cache verify && npm install"
alias clean.yarn="clean.node && yarn"
alias dropbox.conflicted="find ~/Dropbox/ -name '*Copie en conflit*' && find ~/Dropbox/ -name '*Conflict*' && find ~/Dropbox/ -name '*conflict*'"
alias json="python -mjson.tool"
weather() { curl -4 wttr.in/${1:-charenton} }

# Reload the shell (i.e. invoke as a login shell)
alias reload="exec ${SHELL} -l"
