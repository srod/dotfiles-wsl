#!/bin/bash

# System
print_in_blue "\n   Packages - System\n\n"
package_install "Bat" "bat"
package_install "Git" "git"
package_install "Ncdu" "ncdu"
package_install "Ngrep" "ngrep"
package_install "Nmap" "nmap"
package_install "Prettyping" "prettyping"
package_install "Tcpdump" "tcpdump"
package_install "Vim" "vim"
package_uninstall "Vi" "vi"
execute \
    "sudo systemctl enable systemd-resolved" \
    "Enable systemd-resolved"
package_install "Java" "jre-openjdk-headless"
package_install "Diff so Fancy" "diff-so-fancy"
yay_install "Extfat" "sdfat-dkms"
yay_install "Exfat utils" "exfat-utils-nofuse"
package_install "Discover backend" "packagekit-qt5"
package_install "Xclip" "xclip"

# Thunderbolt
package_install "Bolt" "bolt"
execute \
    "sudo systemctl start bolt.service" \
    "Enable bolt service"
yay_install "Plasma Thunderbolt" "plasma-thunderbolt-git"

# Network
print_in_blue "\n   Packages - Network\n\n"
package_install "OpenSSH" "openssh"
package_install "Bind Tools" "bind-tools"
package_install "Network Manager Openvpn" "networkmanager-openvpn"
package_install "kdenetwork-filesharing" "kdenetwork-filesharing"
yay_install "samba-mounter-git" "samba-mounter-git"
package_install "cifs-utils" "cifs-utils"
# package_install "SMB4K" "smb4k"
execute \
    "sudo rm /etc/krb5.conf" \
    "Optimize samba"
package_install "Google Drive" "kio-gdrive"
package_install "KDE Connect" "kdeconnect"

# YAY
print_in_blue "\n   Packages - YAY\n\n"
package_install_from_git "YAY" "yay"
yay_install "YAY" "yay"

# Browsers
print_in_blue "\n   Packages - Browsers\n\n"
yay_install "Brave" "brave-bin"
package_install "Chromium" "chromium"
package_install "Firefox" "firefox"

# Set Brave as default browser
execute \
    "xdg-settings set default-web-browser brave-bin.desktop" \
    "Set Brave as default browser"

# Mail
print_in_blue "\n   Packages - Mail\n\n"
package_install "Thunderbird" "thunderbird"

# GPG
print_in_blue "\n   Packages - GPG\n"
yay_install "Keybase" "keybase-bin"

# IDE
print_in_blue "\n   Packages - IDE\n\n"
yay_install "Sublime Text" "sublime-text-3-imfix"
package_install "Visual Studio Code" "code"

# Terminal
print_in_blue "\n   Packages - Terminal\n\n"
package_install "ZSH Completions" "zsh-completions"

# Utilities
yay_install "Dropbox" "dropbox"
yay_install "Pamac" "pamac-aur"
yay_install "Razer" "python-notify2 polychromatic"
execute \
    "sudo gpasswd -a rodolphe plugdev" \
    "Add rodolphe to plugdev"
yay_install "Simple Note" "simplenote-electron-bin"
package_install "libnotify" "libnotify"
yay_install "One Drive" "onedrive-abraunegg"
package_install "Virtualbox" "virtualbox"
package_install "Virtualbox Guest ISO" "virtualbox-guest-iso"
execute \
    "sudo gpasswd -a rodolphe vboxusers" \
    "Add rodolphe to vboxusers"
package_install "Meld" "meld"
package_install "Unrar" "unrar"
package_install "PDF Arranger" "pdfarranger"

# Videos
print_in_blue "\n   Packages - Videos\n\n"
package_install "VLC" "vlc"

# Fonts
print_in_blue "\n   Packages - Fonts\n\n"
yay_install "Hack Nerd" "nerd-fonts-hack"
yay_install "TTF ms fonts" "ttf-ms-fonts"
yay_install "TTF Monaco" "ttf-monaco"
yay_install "TTF Vista Fonts" "ttf-vista-fonts"
yay_install "TTF Ubuntu Font Family" "ttf-ubuntu-font-family"
yay_install "TTF Roboto" "ttf-roboto"

package_install "TTF Dejavu" "ttf-dejavu"
package_install "TTF Liberation" "ttf-liberation"
package_install "Noto Fonts" "noto-fonts"
package_install "TTF Lato" "ttf-lato"
package_install "Emoji" "noto-fonts-emoji"

# Office
# yay_install "Microsoft Office Online" "ms-office-online"

# Printers
package_install "Printers" "cups cups-pdf ghostscript gsfonts libcups system-config-printer avahi simple-scan --noconfirm --needed"
package_install "drivers" "foomatic-{db,db-ppds,db-gutenprint-ppds,db-nonfree,db-nonfree-ppds} gutenprint"
execute \
    "sudo gpasswd -a rodolphe lp" \
    "Add rodolphe to lp group"

# Drivers Epson XP-700
yay_install "Drivers Epson XP-700" "yay -S epson-inkjet-printer-201208w"

execute \
    "sudo systemctl enable avahi-daemon" \
    "Enable printer service"

execute \
    "sudo systemctl start avahi-daemon" \
    "Enable printer service"

execute \
    "sudo systemctl enable avahi-dnsconfd" \
    "Enable printer service"

execute \
    "sudo systemctl start avahi-dnsconfd" \
    "Enable printer service"

execute \
    "sudo systemctl enable org.cups.cupsd" \
    "Enable printer service"

execute \
    "sudo systemctl start org.cups.cupsd" \
    "Enable printer service"

# YARN
if [ -d "$HOME/.nvm" ]; then
    print_in_blue "\n   Packages - Node\n\n"
    package_install "Yarn" "yarn"
fi