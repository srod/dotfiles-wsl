#!/bin/bash

# System
print_in_blue "\n   Packages - System\n\n"
sudo sh -c 'echo "fastestmirror=True" >> /etc/dnf/dnf.conf'
sudo sh -c 'echo "defaultyes=True" >> /etc/dnf/dnf.conf'
sudo dnf distro-sync
sudo dnf install -y sudo nano vim wget tar net-tools curl htop neofetch xclip
sudo dnf install -y java-latest-openjdk-headless

# YARN
if [ -d "$HOME/.nvm" ]; then
    print_in_blue "\n   Packages - Node\n\n"

    curl --silent --location https://dl.yarnpkg.com/rpm/yarn.repo | sudo tee /etc/yum.repos.d/yarn.repo
    sudo dnf install -y yarn
fi
