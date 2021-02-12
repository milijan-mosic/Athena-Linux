#!/bin/bash

###############
# PREPARATION #
###############

ssd=$(</note/ssd.txt)
efi=$(</note/efi.txt)
hostname=$(</note/hostname.txt)
rootpwd=$(</note/rootpwd.txt)
username=$(</note/username.txt)
userpwd=$(</note/userpwd.txt)
superuser=$(</note/superuser.txt)

set -o pipefail

reflector --latest 5 --sort rate --save /etc/pacman.d/mirrorlist

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
if [ $superuser == 1 ]
then
        goo=1
else
        systemctl enable lightdm
fi

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
localeconf="LANG=en_US.UTF-8"
$localeconf > /etc/locale.conf

############################################
# SETTING UP HOSTNAME AND NETWORK SETTINGS #
############################################

$hostname > /etc/hostname
$base_hostname="# Static table lookup for hostnames.
# See hosts(5) for details.

127.0.0.1	localhost
::1		localhost
127.0.1.1	"
plus="" ; plus="$hostname"
ext=".localdomain $hostname"
$base_hostname="$plus$ext"
$base_hostname > /etc/hosts

#cp /Atina/files/hostname /etc/
#rm -rf /etc/hosts
#cp /Atina/files/hosts /etc/

###########################
# FINALIZING INSTALLATION #
###########################

cd /home/$username/ ; mkdir .config ; chmod ugo+rwx /home/$username/.config/
cd /home/$username/.config/ ; mkdir alacritty
cp /Atina/files/alacritty.yml /home/$username/.config/alacritty/ ; cd /

rm -rf /home/$username/.bashrc
cp /Atina/files/bashrc /home/$username/
mv /home/$username/bashrc /home/$username/.bashrc

if [ $superuser == 1 ]
then
        cp /Atina/files/xinitrc-superuser /home/$username/
        mv /home/$username/xinitrc-superuser /home/$username/.xinitrc
else
        cp /Atina/files/xinitrc /home/$username/
        mv /home/$username/xinitrc /home/$username/.xinitrc
fi

#cp /Atina/files/xinitrc /home/$username/
#mv /home/$username/xinitrc /home/$username/.xinitrc

rm -rf /etc/pacman.conf
cp /Atina/files/pacman.conf /etc/

if [ $superuser == 1 ]
then
        goo=1
else
        rm -rf /etc/lightdm/lightdm.conf
        cp /Atina/files/lightdm.conf /etc/lightdm/
fi

#rm -rf /etc/lightdm/lightdm.conf
#cp /Atina/files/lightdm.conf /etc/lightdm/

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

sudo amixer sset "Auto-Mute Mode" Disabled
sudo alsactl store

if [ $superuser == 1 ]
then
        goo=1
else
        sudo pacman -Rns lxqt-archiver pcmanfm-qt qterminal lxqt-about --noconfirm # lrf-viewer lximage screenshot screengrab
fi

sudo pacman -Scc --noconfirm

cd /home/$username/ ; mkdir .atina ; chmod ugo+rwx /home/$username/.atina/
cp -r /Atina/scrollbook/ /home/$username/.atina/

if [ $superuser == 1 ]
then
        cd /home/$username/ ; mkdir .myconfig
        cd /home/$username/.myconfig
        git clone https://aur.archlinux.org/yay.git
        cd yay
        makepkg -sic --noconfirm

        cd ~/
        git clone https://github.com/windwalk-bushido/AIFAL.git
        git clone https://github.com/windwalk-bushido/Atina.git

        cp /home/$username/AIFAL/scrollbook/search.sh ~/.atina/scrollbook/
        cp /home/$username/AIFAL/scrollbook/yay.sh ~/.atina/scrollbook/
        cp /home/$username/AIFAL/scrollbook/mount-dvd.sh ~/.atina/scrollbook/
        cp /home/$username/AIFAL/scrollbook/unmount-dvd.sh ~/.atina/scrollbook/
        cd /home/$username/

        chmod ugo+rwx /home/$username/.atina/scrollbook/

        rm -rf /home/$username/.bashrc
        cp /home/$username/Atina/files/bashrc-superuser /home/$username/
        mv /home/$username/bashrc-superuser /home/$username/.bashrc

        cd /home/$username/ ; rm -rf /home/$username/AIFAL ; rm -rf /home/$username/Atina

        yay -S ttf-iosevka gedit-latex cherrytree labyrinth peaclock --noconfirm

        yay -Scc --noconfirm
        sudo pacman -Scc --noconfirm
else
        goo=1
fi

cp /note/superuser.txt /home/$username/
rm -rf /note/
rm -rf /Atina/
