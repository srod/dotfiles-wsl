# Command upgrades
# alias ll="ls -alh --color"
alias ll="$(brew --prefix coreutils)/libexec/gnubin/ls -ahlF --color --group-directories-first"
alias ln="ln -v"
alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"
alias vi="/usr/local/bin/vim"
alias vim="/usr/local/bin/vim"

# Navigation
alias cdf="cd `osascript -e 'tell application \"Finder\" to if window 1 exists then if target of window 1 as string is not \":\" then get POSIX path of (target of window 1 as alias)'`"
alias drive="~/Library/Mobile\ Documents/com\~apple\~CloudDocs"
alias dotfiles="cd $DOTFILES"
alias library="cd $HOME/Library"

# Maintenance
alias lsdu="du -csh $(pwd)"
alias check-space="du -h ~/ | grep '^[0-9]*.[0-9]G'"
alias sizedir="du -sh */ | sort -h"
alias pid="ps x | grep -i $1"
alias grep="grep --color=auto"

# Update
alias brewup="brew update; brew upgrade; brew cleanup; brew cu -y"
alias gemup="gem update --system; gem update; gem cleanup"
alias opamup="opam update; opam upgrade"
alias npmup="npm -g update; npm install -g npm"
alias sysup="sudo softwareupdate -i -a"
alias update="brewup; gemup; opamup; npmup; sysup"

# Work
alias work="cd ~/Dropbox/www"
alias work.2clics="cd ~/Dropbox/www/www.2clics.net"
alias work.node-minify="cd ~/Dropbox/www/github/node-minify"
alias work.node-version="cd ~/Dropbox/www/github/node-version"

# Network
alias network.ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias network.iplocal="ipconfig getifaddr en0"
alias network.ips="ifconfig -a | grep -o 'inet6\? \(\([0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+\)\|[a-fA-F0-9:]\+\)' | sed -e 's/inet6* //'"
alias network.speedtest="wget -O /dev/null http://speedtest.wdc01.softlayer.com/downloads/test10.zip"
alias network.ping="ping -c 5" # ping 5 times by default
alias ping=network.ping

# Show active network interfaces
alias network.ifactive="ifconfig | pcregrep -M -o '^[^\t:]+:([^\n]|\n\t)*status: active'"

# Flush Directory Service cache
alias network.flush="dscacheutil -flushcache && sudo killall -HUP mDNSResponder && echo 'DNS flushed'"

# View HTTP traffic
alias network.sniff="sudo ngrep -d 'en0' -t '^(GET|POST) ' 'tcp and port 80'"
alias network.httpdump="sudo tcpdump -i en0 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# SSH
alias connect.usg="ssh 192.168.1.1"
alias connect.key="ssh 192.168.1.2"
alias connect.nas="ssh 192.168.1.6"

# MAC
alias mac.shutdown="osascript -e 'tell application \"System Events\" to shut down'"
alias mac.restart="osascript -e 'tell application \"System Events\" to restart'"
alias mac.logout="osascript -e 'tell application \"System Events\" to log out'"
alias mac.sleep="osascript -e 'tell application \"System Events\" to sleep'"

# Show / Hide hidden files
alias show.hidden="defaults write com.apple.finder AppleShowAllFiles YES && killall 'Finder'"
alias hide.hidden="defaults write com.apple.finder AppleShowAllFiles NO && killall 'Finder'"

# Utils
alias clean.ds_store="find . -type f -name '*.DS_Store' -ls -delete"
alias clean.node="rm -rf node_modules"
alias clean.npm="clean.node && npm cache verify && npm install"
alias clean.yarn="clean.node && yarn"
alias dropbox.conflicted="find ~/Dropbox/ -name '*Copie en conflit*' && find ~/Dropbox/ -name '*Conflict*' && find ~/Dropbox/ -name '*conflict*'"
alias json="python -mjson.tool"
alias updatedb="sudo /usr/libexec/locate.updatedb"
alias copyssh="pbcopy < $HOME/.ssh/id_rsa.pub"
weather() { curl -4 wttr.in/${1:-charenton} }
alias shrug="echo '¯\_(ツ)_/¯' | pbcopy"

# Reload the shell (i.e. invoke as a login shell)
alias reload="exec ${SHELL} -l"
