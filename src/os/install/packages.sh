#!/bin/bash

# System
print_in_blue "\n   Packages - System\n\n"
#package_install "Bat" "bat"
package_install "Git" "git"
package_install "Ncdu" "ncdu"
package_install "Ngrep" "ngrep"
package_install "Nmap" "nmap"
#package_install "Prettyping" "prettyping"
package_install "Tcpdump" "tcpdump"
package_install "Vim" "vim"
package_install "Java" "default-jdk-headless"
#package_install "Diff so Fancy" "diff-so-fancy"
package_install "Xclip" "xclip"
package_install "Neofetch" "neofetch"
package_install "Htop" "htop"

# YARN
if [ -d "$HOME/.nvm" ]; then
    print_in_blue "\n   Packages - Yarn\n\n"
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
    sudo apt-get update && sudo apt-get install yarn
fi
