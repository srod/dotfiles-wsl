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

echo "### Activate connection ###"

echo "################################################################################"



nmtui



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



sudo pacman -S --noconfirm --needed --asdeps cups cups-pdf ghostscript gsfonts gutenprint gtk3-print-backends libcups system-config-printer

sudo gpasswd -a rodolphe lp

sudo systemctl enable avahi-daemon

sudo systemctl start avahi-daemon

sudo systemctl enable avahi-dnsconfd

sudo systemctl start avahi-dnsconfd

sudo systemctl enable org.cups.cupsd

sudo systemctl start org.cups.cupsd



clear



echo "################################################################################"

echo "### Install and setup display manager and desktop ###"

echo "################################################################################"



sleep 2



sudo pacman -S --noconfirm --needed --asdeps pacman -S xf86-video-intel mesa xorg-server bumblebee bbswitch-dkms nvidia nvidia-settings primus

sudo gpasswd -a rodolphe bumblebee video

sudo systemctl enable bumblebeed.service



echo "################################################################################"

echo "What is your preferred desktop environment"

echo "1) KDE Plasma"

echo "2) XFCE4"

echo "################################################################################"


read case;

case $case in

1)


echo "You selected KDE Plasma"

sudo pacman -S --noconfirm --needed --asdeps plasma-meta  kde-applications-meta sddm

sudo systemctl enable sddm

yay -S --noconfirm --needed --asdeps plasma-thunderbolt-git


;;

2)


echo "You selected XFCE4"

sudo pacman -S --noconfirm --needed --asdeps xfce4 xfce4-goodies lightdm

sudo systemctl enable lightdm


;;

esac


clear



echo "################################################################################"

echo "### Installing needed ###"

echo "################################################################################"



sudo pacman -S --noconfirm --needed --asdeps gvfs-afc gvfs-google gvfs-gphoto2 gvfs-mtp gvfs-nfs gvfs-smb

yay -S --noconfirm --needed --asdeps mugshot



clear



echo "################################################################################"

echo "### Installation completed, please reboot when ready ###"

echo "################################################################################"



sleep 2
