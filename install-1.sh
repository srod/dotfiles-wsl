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

echo "### Setting makepkg to use all cores ###"

echo "################################################################################"



sleep 2



nc=$(grep -c ^processor /proc/cpuinfo)



echo "You have "$nc" cores."

echo "Changing the makeflags for "$nc" cores."

sudo sed -i "s/#MAKEFLAGS=\"-j2\"/MAKEFLAGS=\"-j$nc\"/g" /etc/makepkg.conf

echo "Changing the compression settings for "$nc" cores."

sudo sed -i "s/COMPRESSXZ=(xz -c -z -)/COMPRESSXZ=(xz -c -T $nc -z -)/g" /etc/makepkg.conf



sleep 2

clear



echo "################################################################################"

echo "### Installing the fastest repos, this could take a while ###"

echo "################################################################################"



sleep 2



sudo pacman -S reflector --noconfirm --needed --asdeps

sudo reflector --latest 100 -p https --country France --sort rate --save /etc/pacman.d/mirrorlist

clear



# echo "##########################################################################"

# echo "### Installing needed packages ###"

# echo "##########################################################################"



# sleep 2



# sudo pacman -Syyu --noconfirm --needed --asdeps

# clear



echo "##########################################################################"

echo "### Refresh repo keys ###"

echo "##########################################################################"



echo "Refreshing software repo keys, this will take a while (recommended)"

sudo pacman-key --refresh-keys

sudo pacman -S --noconfirm --needed --asdeps neofetch git wget linux-headers rsync go htop

clear



echo "##########################################################################"

echo "### Setting up locale ###"

echo "##########################################################################"



sed -i 's/'#en_US.UTF-8'/'en_US.UTF-8'/g' /etc/locale.gen

locale-gen



echo "##########################################################################"

echo "### Setting up keyboard ###"

echo "##########################################################################"



echo "LANG=en_US.UTF-8" > /etc/locale.conf
echo "KEYMAP=fr-latin9" > /etc/vconsole.conf



echo "##########################################################################"

echo "### Setting up localtime ###"

echo "##########################################################################"



ln -sf /usr/share/zoneinfo/Europe/Paris /etc/localtime
echo "FallbackNTP=0.pool.ntp.org 1.pool.ntp.org 0.fr.pool.ntp.org" >> /etc/systemd/timesyncd.conf
systemctl enable systemd-timesyncd.service



echo "##########################################################################"

echo "### Setting up clock ###"

echo "##########################################################################"



hwclock --systohc



echo "##########################################################################"

echo "### Setting up hostname ###"

echo "##########################################################################"



read -p "Hostname [ex: archlinux]: " host_name
echo "$host_name" > /etc/hostname

echo "# IPv4 Hosts" >> /etc/hosts
echo "127.0.0.1       localhost ${host_name}" >> /etc/hosts
echo "" >> /etc/hosts
echo "# Machine FQDN" >> /etc/hosts
echo "127.0.1.1       ${host_name}.localdomain ${host_name}" >> /etc/hosts
echo "" >> /etc/hosts
echo "# IPv6 Hosts" >> /etc/hosts
echo "::1             localhost       ip6-localhost   ip6-loopback" >> /etc/hosts
echo "ff02::1         ip6-allnodes" >> /etc/hosts
echo "ff02::2         ip6-allrouters" >> /etc/hosts



echo "##########################################################################"

echo "### Root password ###"

echo "##########################################################################"



passwd



echo "##########################################################################"

echo "### Installing and setting up sound ###"

echo "##########################################################################"



sleep 2



sudo pacman -S --noconfirm --needed --asdeps pulseaudio pulseaudio-alsa pavucontrol alsa-utils alsa-plugins alsa-lib alsa-firmware lib32-alsa-lib lib32-alsa-oss lib32-alsa-plugins gstreamer gst-plugins-good gst-plugins-bad gst-plugins-base gst-plugins-ugly volumeicon playerctl

clear



echo "################################################################################"

echo "### Installing and setting up bluetooth ###"

echo "################################################################################"



sleep 2



sudo pacman -S --noconfirm --needed --asdeps pulseaudio-bluetooth bluez bluez-libs bluez-utils bluez-firmware blueberry

sudo systemctl enable bluetooth.service

sudo systemctl start bluetooth.service

sudo sed -i 's/'#AutoEnable=false'/'AutoEnable=true'/g' /etc/bluetooth/main.conf

clear



echo "################################################################################"

echo "### Installing Samba and network sharing ###"

echo "################################################################################"



sleep 2



#Access samba share windows

sudo pacman -S --noconfirm --needed --asdeps gvfs-smb avahi

sudo systemctl enable avahi-daemon.service

sudo systemctl start avahi-daemon.service

sudo pacman -S --noconfirm --needed --asdeps nss-mdns

sudo sed -i 's/dns/mdns dns wins/g' /etc/nsswitch.conf



clear



echo "################################################################################"

echo "### Installing fix the unicode problem ###"

echo "################################################################################"



sleep 2



sudo pacman -S --noconfirm --needed --asdeps intel-ucode

clear



echo "################################################################################"

echo "### Installing Bootloader ###"

echo "################################################################################"



sleep 2


sudo sed -i 's/MODULES=()/MODULES=(ext4)/g' /etc/mkinitcpio.conf
sudo sed -i 's/HOOKS=(base udev autodetect modconf block filesystems/HOOKS=(base udev autodetect modconf block filesystems encrypt lvm2/g' /etc/mkinitcpio.conf

mkinitcpio -p linux

sudo pacman -S --noconfirm --needed --asdeps grub efibootmgr
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=Arch

sudo sed -i 's/GRUB_CMDLINE_LINUX=""/GRUB_CMDLINE_LINUX="cryptdevice=\/dev\/nvme0n1p6:cryptlvm:allow-discards"/g' /etc/default/grub

mkdir -p /mnt/windows
mount /dev/nvme0n1p4 /mnt/windows

grub-mkconfig -o /boot/grub/grub.cfg



clear



echo "################################################################################"

echo "### Installing Network tools ###"

echo "################################################################################"



sleep 2



pacman -S --noconfirm --needed --asdeps net-tools wireless_tools dialog iw wpa_supplicant



clear



echo "################################################################################"

echo "### Installing Network Manager ###"

echo "################################################################################"



sleep 2



pacman -S --noconfirm --needed --asdeps networkmanager networkmanager-openvpn
systemctl enable NetworkManager



clear



echo "################################################################################"

echo "### Installing SSD Trim ###"

echo "################################################################################"



sleep 2



systemctl enable fstrim.timer



clear



echo "################################################################################"

echo "### Installing nVidia graphics card ###"

echo "################################################################################"



sudo pacman -S --noconfirm --needed --asdeps nvidia nvidia-cg-toolkit nvidia-settings nvidia-utils lib32-nvidia-cg-toolkit lib32-nvidia-utils lib32-opencl-nvidia opencl-nvidia cuda ffnvcodec-headers lib32-libvdpau libxnvctrl pycuda-headers python-pycuda python2-pycuda

sudo pacman -R --noconfirm xf86-video-nouveau



clear



echo "################################################################################"

echo "### Installation completed, please reboot when ready ###"

echo "################################################################################"



sleep 2