#!/bin/bash



#########
# SETUP #
#########

timedatectl set-ntp true
hwclock --systohc # Check what's this

ssd=$(</note/ssd.txt)
uefi=$(</note/uefi.txt)
hostname=$(</note/hostname.txt)
rootpwd=$(</note/rootpwd.txt)
username=$(</note/username.txt)
userpwd=$(</note/userpwd.txt)

set -o pipefail

reflector --latest 5 --sort rate --save /etc/pacman.d/mirrorlist



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
gpasswd -a $username rfkill
echo -e "$userpwd\n$userpwd" | passwd $username


rm -rf /etc/sudoers
cp /Atina/files/sudoers /etc/



#####################################
# SETTING UP LANGUAGES AND KEYBOARD #
#####################################

rm -rf /etc/locale.gen
cp /Atina/files/locale.gen /etc/
locale-gen


cd /etc/ ; set_lang="LANG=en_US.UTF-8"
echo $set_lang > locale.conf ; cd /



############################################
# SETTING UP HOSTNAME AND NETWORK SETTINGS #
############################################

cd /etc/ ; echo $hostname > hostname


cp /Atina/files/hosts /etc/
ext=".localdomain $hostname"
base_hostname="$hostname$ext"
echo $base_hostname >> hosts ; cd /



###########################
# FINALIZING INSTALLATION #
###########################

cd /home/$username/ ; mkdir .config ; chmod ugo+rwx /home/$username/.config/
cd /home/$username/.config/ ; mkdir alacritty
cp /Atina/files/alacritty.yml /home/$username/.config/alacritty/ ; cd /


rm -rf /home/$username/.bashrc
cp /Atina/files/bashrc /home/$username/
mv /home/$username/bashrc /home/$username/.bashrc


cp /Atina/files/xinitrc /home/$username/
mv /home/$username/xinitrc /home/$username/.xinitrc


rm -rf /etc/pacman.conf
cp /Atina/files/pacman.conf /etc/


rm -rf /etc/lightdm/lightdm.conf
cp /Atina/files/lightdm.conf /etc/lightdm/


pacman -Syu --noconfirm
bash /Atina/scrollbook/32bit.sh



###########################
# SETTING UP A BOOTLOADER #
###########################

if [ $uefi == 1 ]
then
        grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
        grub-mkconfig -o /boot/grub/grub.cfg
else
        grub-install --target=i386-pc $ssd
        grub-mkconfig -o /boot/grub/grub.cfg
fi


sed -i 's/set timeout=5/set timeout=0.1/g' /boot/grub/grub.cfg



#####################################
# ENABLING AUDIO AND CLEANING CACHE #
#####################################

sudo amixer sset "Auto-Mute Mode" Disabled
sudo alsactl store


sudo pacman -Rns lxqt-archiver pcmanfm-qt qterminal lxqt-about --noconfirm

sudo pacman -Scc --noconfirm


cd /home/$username/ ; mkdir .atina ; chmod ugo+rwx /home/$username/.atina/
cp -r /Atina/scrollbook/ /home/$username/.atina/ ; cd /


mkdir /Configs/ ; cd /Configs/
git clone https://github.com/windwalk-bushido/Athena-Linux-DE-Configs.git
rm -rf /home/$username/.config/lxqt
cp -r /Configs/lxqt /home/$username/.config/

cd /etc/ ; mkdir my_configs
cd my_configs ; mkdir menu_icon
cd menu_icon/ ; cp /Configs/helmet.svg . ; cd /


rm -rf /note/
rm -rf /Atina/
rm -rf /Configs/
