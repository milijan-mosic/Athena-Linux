#!/bin/bash



#########
# SETUP #
#########

timedatectl set-ntp true
hwclock -w

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

systemctl enable NetworkManager
systemctl enable nftables.service
systemctl enable paccache.timer
systemctl enable lightdm
systemctl enable clamav-freshclam.service
systemctl enable clamav-daemon.service



######################################
# CREATING USER & CHANGING PASSWORDS #
######################################

echo -e "$rootpwd\n$rootpwd" | passwd root
useradd -m -G wheel -s /bin/bash $username
gpasswd -a $username optical
gpasswd -a $username storage
gpasswd -a $username rfkill # User could'nt change Bluetooth On/Off without this... weird.
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
echo $base_hostname >> hosts
cat /Atina/files/block_ip_addresses >> hosts ; cd /



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


amixer sset "Auto-Mute Mode" Disabled
alsactl store


cd /home/$username/ ; mkdir .atina ; chmod ugo+rwx /home/$username/.atina/
cp -r /Atina/scrollbook/ /home/$username/.atina/ ; cd /


mkdir /Configs/ ; cd /Configs/
git clone https://github.com/windwalk-bushido/Athena-Linux-DE-Configs.git
rm -rf /home/$username/.config/lxqt
cp -r /Configs/lxqt /home/$username/.config/

cd /etc/ ; mkdir my_configs
cd my_configs ; mkdir menu_icon
cd menu_icon/ ; cp /Configs/helmet.svg . ; cd /


pacman -Syu --noconfirm
bash /Atina/scrollbook/32bit.sh

pacman -Rns lxqt-archiver pcmanfm-qt qterminal lxqt-about --noconfirm
pacman -Scc --noconfirm



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

rm -rf /note/
rm -rf /Atina/
rm -rf /Configs/
