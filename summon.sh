#!/bin/bash

###############
# PREPARATION #
###############

# ssd=cat /note/ssd.txt
# efi=cat /note/efi.txt
# rootpwd=cat /note/rootpwd.txt
# userpwd=cat /note/userpwd.txt
# username=cat /note/username.txt

ssd="/dev/sda"
efi=0
rootpwd=11111
username="windwalk"
userpwd=$rootpwd

set -o pipefail

timedatectl set-ntp true

#######################
# SETTING UP TIMEZONE #
#######################

ln -sf /usr/share/zoneinfo/Europe/Belgrade /etc/localtime
timedatectl set-timezone Europe/Belgrade

#############################
# ENABLING SYSTEMD SERVICES #
#############################

systemctl enable --now NetworkManager
systemctl enable --now nftables.service
systemctl enable --now paccache.timer
systemctl enable lightdm

######################################
# CREATING USER & CHANGING PASSWORDS #
######################################

echo -e "$rootpwd\n$rootpwd" | passwd root
useradd -m -G wheel -s /bin/bash $username
gpasswd -a $username optical
gpasswd -a $username storage
echo -e "$userpwd\n$userpwd" | passwd $username

rm -rf /etc/sudoers
cp /Atina/files/sudoers /etc/

#####################################
# SETTING UP LANGUAGES AND KEYBOARD #
#####################################

rm -rf /etc/locale.gen
cp /Atina/files/locale.gen /etc/
locale-gen
cp /Atina/files/locale.conf /etc/

############################################
# SETTING UP HOSTNAME AND NETWORK SETTINGS #
############################################

cp /Atina/files/hostname /etc/
rm -rf /etc/hosts
cp /Atina/files/hosts /etc/

###########################
# FINALIZING INSTALLATION #
###########################

rm -rf /home/$username/.bashrc
cp /Atina/files/bashrc /home/$username/
mv /home/$username/bashrc /home/$username/.bashrc

cp /Atina/files/xinitrc /home/$username/
mv /home/$username/xinitrc /home/$username/.xinitrc

rm -rf /etc/pacman.conf
cp /Atina/files/pacman.conf /etc/

rm -rf /etc/lightdm/lightdm.conf
cp /Atina/files/lightdm.conf /etc/lightdm/

pacman -Sy
bash /Atina/scrollbook/32bit.sh

###########################
# SETTING UP A BOOTLOADER #
###########################

if [ $efi == 1 ]
then
        grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
        grub-mkconfig -o /boot/grub/grub.cfg
else
        grub-install --target=i386-pc $ssd
        grub-mkconfig -o /boot/grub/grub.cfg
fi

#####################################
# ENABLING AUDIO AND CLEANING CACHE #
#####################################

sudo amixer -c 0 sset "Auto-Mute Mode" Disabled
sudo alsactl store

sudo pacman -Rns xfce4-terminal
sudo pacman -Scc --noconfirm
rm -rf /note/
rm -rf /Atina/

cd /home/$username/
git clone https://github.com/windwalk-bushido/Atina.git ; cd /