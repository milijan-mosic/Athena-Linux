#!/bin/bash

###############
# PREPARATION #
###############

cd /note
ssd=cat ssd.txt
efi=cat efi.txt
rootpwd=cat rootpwd.txt
username=cat username.txt
userpwd=cat userpwd.txt
cd /

set -o pipefail

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

######################################
# CREATING USER & CHANGING PASSWORDS #
######################################

echo -e "$rootpwd\n$rootpwd" | passwd root
useradd -m -G wheel -G optical -G storage -s /bin/bash $username
echo -e "$userpwd\n$userpwd" | passwd $username

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

sudo pacman -Scc --noconfirm
rm -rf /note/

cd /home/$username/
git clone https://github.com/windwalk-bushido/Atina.git ; cd /