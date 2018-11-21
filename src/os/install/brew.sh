#!/bin/bash

# Tap
print_in_blue "\n   Brews - Tap\n\n"
brew_install "buo" "" "buo/cask-upgrade"

# System
print_in_blue "\n   Brews - System\n\n"
brew_install "Bat" "bat"
brew_install "Coreutils" "coreutils"
brew_install "Curl" "curl --with-nghttp2"
brew_install "Diff-so-fancy" "diff-so-fancy"
brew_install "Findutils" "findutils"
brew_install "Fd" "fd"
brew_install "Git" "git"
brew_install "Grep" "grep --with-default-names"
brew_install "Mac App Store" "mas"
brew_install "Ncdu" "ncdu"
brew_install "Prettyping" "prettyping"
brew_install "Python 2" "python@2"
brew_install "Python 3" "python@3"
brew_install "Vim" "vim --with-override-system-vi"
brew_install "Wget" "wget --with-iri"

# Browsers
print_in_blue "\n   Brews - Browsers\n\n"
brew_install "Brave" "brave-browser" "caskroom/cask" "cask"
brew_install "Chrome" "google-chrome" "caskroom/cask" "cask"
brew_install "Firefox" "firefox" "caskroom/cask" "cask"

# Cleaners
print_in_blue "\n   Brews - Cleaners\n\n"
brew_install "Malwarebytes" "malwarebytes" "caskroom/cask" "cask"
brew_install "Onyx" "onyx" "caskroom/cask" "cask"

# File Comparison
print_in_blue "\n   Brews - File Comparison\n\n"
brew_install "Kaleidoscope" "kaleidoscope" "caskroom/cask" "cask"

# GPG
print_in_blue "\n   Brews - GPG\n"
brew_install "Keybase" "keybase" "caskroom/cask" "cask"

# IDE
print_in_blue "\n   Brews - IDE\n\n"
brew_install "Sublime Text" "sublime-text" "caskroom/cask" "cask"
brew_install "Visual Studio Code" "visual-studio-code" "caskroom/cask" "cask"

# Instagram
print_in_blue "\n   Brews - Instagram\n\n"
brew_install "Flume" "flume" "caskroom/cask" "cask"

# Password Manager
print_in_blue "\n   Brews - Password Manager\n\n"
brew_install "1password" "1password" "caskroom/cask" "cask"

# PDF
print_in_blue "\n   Brews - PDF\n\n"
brew_install "PDFelement" "pdfelement" "caskroom/cask" "cask"

# Security
print_in_blue "\n   Brews - Security\n\n"
brew_install "Authy" "authy" "caskroom/cask" "cask"
brew_install "Avast Security" "avast-security" "caskroom/cask" "cask"
brew_install "GPG Suite" "gpg-suite" "caskroom/cask" "cask"
brew_install "Micro Snitch" "micro-snitch" "caskroom/cask" "cask"
brew_install "Oversight" "oversight" "caskroom/cask" "cask"

# Subtitles
print_in_blue "\n   Brews - Subtitles\n\n"
brew_install "SubsMarine" "subsmarine" "caskroom/cask" "cask"

# Terminal
print_in_blue "\n   Brews - Terminal\n\n"
brew_install "Hyper" "hyper" "caskroom/cask" "cask"
brew_install "ZSH Completions" "zsh-completions"

# Unarchivers
print_in_blue "\n   Brews - Unarchivers\n\n"
brew_install "Keka" "keka" "caskroom/cask" "cask"
brew_install "Keka Default App" "kekadefaultapp" "caskroom/cask" "cask"

# Usenet
print_in_blue "\n   Brews - Usenet\n\n"
brew_install "Panic Unison" "panic-unison" "caskroom/cask" "cask"

# Utilities
print_in_blue "\n   Brews - Utilities\n\n"
brew_install "Dropbox" "dropbox" "caskroom/cask" "cask"
brew_install "iStat Menus" "istat-menus" "caskroom/cask" "cask"
brew_install "Keeping you awake" "keepingyouawake" "caskroom/cask" "cask"

# Videos
print_in_blue "\n   Brews - Videos\n\n"
brew_install "VLC" "vlc" "caskroom/cask" "cask"

# VPN
print_in_blue "\n   Brews - VPN\n\n"
brew_install "Tunnelblick" "tunnelblick" "caskroom/cask" "cask"

# Windows Manager
print_in_blue "\n   Brews - Windows Manager\n\n"
brew_install "Slate" "slate" "caskroom/cask" "cask"

# Development
print_in_blue "\n   Brews - Development\n\n"
brew_install "Postman" "postman" "caskroom/cask" "cask"
brew_install "Insomnia" "insomnia" "caskroom/cask" "cask"

# Capture
#print_in_blue "\n   Brews - Capture\n\n"
#brew_install "Licecap" "licecap" "caskroom/cask" "cask"

# Monitor
#print_in_blue "\n   Brews - Monitor\n\n"
#brew_install "Stay" "stay" "caskroom/cask" "cask"
#brew_install "SwitchResX" "SwitchResX" "caskroom/cask" "cask"

# Optimisations
print_in_blue "\n   Brews - Optimisations\n\n"
brew_install "ImageOptim" "imageoptim" "caskroom/cask" "cask"

# Fonts
print_in_blue "\n   Brews - Fonts\n\n"
# brew_install "Fira Code" "font-fira-code" "caskroom/fonts" "cask"
# brew_install "Fira Code Nerd" "font-firacode-nerd-font-mono" "caskroom/fonts" "cask"
brew_install "Hack Nerd" "font-hack-nerd-font-mono" "caskroom/fonts" "cask"

# YARN
if [ -d "$HOME/.nvm" ]; then
    print_in_blue "\n   Brews - Node\n\n"
    brew_install "Yarn" "yarn" "" "" "--without-node"
fi
