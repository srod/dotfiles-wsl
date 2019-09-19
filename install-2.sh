#!/bin/bash

###############################################################################

### Installing Arch Linux By: ###

### Erik Sundquist ###

###############################################################################

### Review and edit before using ###

###############################################################################



set -e

clear



echo "################################################################################"

echo "### Add user ###"

echo "################################################################################"



sleep 2



useradd -m -g wheel -c 'Rodolphe Stoclin' rodolphe
passwd rodolphe



clear



echo "################################################################################"

echo "### Root access ###"

echo "################################################################################"



sleep 2



pacman -S --noconfirm --needed --asdeps sudo

sed -i "s/# %wheel ALL=(ALL)/%wheel ALL=(ALL)/g" /etc/sudoers

su rodolphe



clear



echo "################################################################################"

echo "### Installing YAY ###"

echo "################################################################################"



sleep 2



git clone https://aur.archlinux.org/yay.git

cd yay

makepkg -si --noconfirm --needed --asdeps

cd ..

rm yay -R -f



clear



echo "################################################################################"

echo "### Installing and setting up printers ###"

echo "################################################################################"



sleep 2



sudo pacman -S --noconfirm --needed --asdeps cups cups-pdf ghostscript gsfonts gutenprint gtk3-print-backends libcups hplip system-config-printer

yay -S --noconfirm --needed --asdeps epson-inkjet-printer-201211w

sudo systemctl enable org.cups.cupsd.service

clear



echo "################################################################################"

echo "### Installing extra fonts ###"

echo "################################################################################"



sleep 2



sudo pacman -S --noconfirm --needed --asdeps adobe-source-sans-pro-fonts cantarell-fonts noto-fonts terminus-font ttf-bitstream-vera ttf-dejavu ttf-droid ttf-inconsolata ttf-liberation ttf-roboto ttf-ubuntu-font-family tamsyn-font

yay -S --noconfirm --needed --asdeps ttf-ms-fonts

clear



echo "################################################################################"

echo "### Install and setup display manager and desktop KDE Plasma ###"

echo "################################################################################"



sleep 2



sudo pacman -S --noconfirm --needed --asdeps pacman -S xf86-video-intel mesa xorg-server bumblebee bbswitch-dkms nvidia nvidia-settings primus

sudo gpasswd -a rodolphe bumblebee video

sudo systemctl enable bumblebeed.service

sudo pacman -S --noconfirm --needed --asdeps plasma-meta  kde-applications-meta sddm

sudo systemctl enable sddm



clear



echo "################################################################################"

echo "### Installing software center ###"

echo "################################################################################"



sleep 2



yay -S --noconfirm --needed --asdeps pamac



clear



echo "################################################################################"

echo "### Installation completed, please reboot when ready ###"

echo "################################################################################"



sleep 2
